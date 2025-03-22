import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/presentation/footer.dart';
import 'package:sushiyana_flutter/presentation/tabs/items_tab.dart';
import 'package:sushiyana_flutter/presentation/tabs/main_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  String? _selectedHeroTag;

  String dynamicLogo = "assets/images/logo2.png";
  String appBarTitle = "Willkommen in Sushi Yana!";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (mounted) {
        setState(() {
          if (_tabController.index == 0) {
            dynamicLogo = "assets/images/logo2.png";
          } else {
            dynamicLogo = getHeroImagePath(_selectedHeroTag ?? "");
          }
        });
      }
      if (_tabController.indexIsChanging) {
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _resetToHome() {
    setState(() {
      MainTab.mainTabMode = 0;
      _selectedHeroTag = null;
      dynamicLogo = "assets/images/logo2.png";
    });

    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _tabController.animateTo(0);
  }

  void _onItemTapped(String heroTag) {
    if (heroTag == "Sushis") {
      setState(() {
        MainTab.mainTabMode = 1;
      });
    } else if (heroTag == "Warme Küche") {
      setState(() {
        MainTab.mainTabMode = 2;
      });
    } else {
      setState(() {
        _selectedHeroTag = heroTag;
      });
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _tabController.animateTo(1);
    }
  }

  void _onBack() {
    setState(() {
      dynamicLogo = "assets/images/logo2.png";
    });
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _tabController.animateTo(0);
  }

  String getHeroImagePath(String heroTag) {
    if (localDatabase.containsKey(heroTag)) {
      return localDatabase[heroTag]["imagePath"];
    }

    for (var category in ["Sushis", "Warme Küche"]) {
      if (localDatabase[category]?["categories"]?.containsKey(heroTag) ??
          false) {
        return localDatabase[category]["categories"][heroTag]["imagePath"];
      }
    }

    return "assets/images/logo2.png"; // Standardbild, falls kein Match
  }

  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);

    if (_tabController.index == 0) {
      appBarTitle =
          "Willkommen in Sushi Yana ${branchProvider.branchData["name"]}!";
    } else if (_tabController.index == 1 && _selectedHeroTag != null) {
      appBarTitle = "$_selectedHeroTag";
    } else {
      appBarTitle =
          "Willkommen in Sushi Yana ${branchProvider.branchData["name"]}!";
    }

    Color indicatorColor =
        (_tabController.index == 1) ? yanaColorOld : Colors.white;

    Color unselectedLabelColor = (_tabController.index == 1)
        ? const Color.fromARGB(255, 127, 127, 127)
        : Colors.black;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Footer(
          onResetHome: _resetToHome,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                toolbarHeight: 25,
                floating: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                pinned: true,
                stretch: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(3),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: Text(
                    appBarTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Julee",
                        fontSize: 11.5,
                        fontWeight: FontWeight.w100),
                  ),
                  background: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      dynamicLogo,
                      cacheHeight: 130,
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: indicatorColor,
                    indicatorWeight: 6,
                    labelColor: indicatorColor,
                    dividerColor: indicatorColor,
                    unselectedLabelColor: unselectedLabelColor,
                    tabs: _tabs,
                  ),
                  _tabController.index,
                ),
                pinned: true,
              ),
            ];
          },
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _tabController.animateTo(index);
            },
            children: [
              MainTab(onItemTapped: _onItemTapped),
              _selectedHeroTag != null
                  ? ItemsTab(heroTag: _selectedHeroTag!, onBack: _onBack)
                  : EmptyTab(
                      onBack: _onBack,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<Tab> _tabs = [
  Tab(
    icon: Icon(
      Icons.grid_view,
    ),
  ),
  Tab(
    icon: Icon(Icons.restaurant_menu),
  ),
];

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar, this.activeIndex);

  final TabBar _tabBar;
  final int activeIndex;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Color barColor = (activeIndex == 1) ? Colors.black : yanaColor;

    return Material(
      color: barColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return oldDelegate.activeIndex != activeIndex;
  }
}
