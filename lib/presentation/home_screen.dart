import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/application/scroll_state_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/presentation/footer.dart';
import 'package:sushiyana_flutter/presentation/lottie_animation_duration.dart';
import 'package:sushiyana_flutter/presentation/tabs/items_tab.dart';
import 'package:sushiyana_flutter/presentation/tabs/main_tab.dart';

final GlobalKey<NestedScrollViewState> scrollControlerKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static int previousIndex = 0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//  isBotScrollButtonEnabled = true; in maintabs

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  String? _selectedHeroTag;

  double innerOffset = 0;

  String dynamicLogo = "assets/images/logo2.png";
  String appBarTitle = "Willkommen in Sushi Yana!";

  // bool isTopScrollButtonEnabled = false;
  bool isTopScrollButtonLocked = false;

  // bool isBotScrollButtonEnabled = true;
  bool isBotScrollButtonLocked = false;

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

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        innerController.addListener(
          () {
            if (mounted) {
              _updateScrollState();
            }
          },
        );
      },
    );
  }

  ScrollController get outerController {
    return scrollControlerKey.currentState!.outerController;
  }

  ScrollController get innerController {
    return scrollControlerKey.currentState!.innerController;
  }

  void _updateScrollState() {
    final scrollStateProvider =
        Provider.of<ScrollStateProvider>(context, listen: false);

    setState(() {
      innerOffset = innerController.positions.last.pixels;
    });

    if (!isTopScrollButtonLocked) {
      if (innerOffset > 0) {
        scrollStateProvider.setTopScrollButtonEnabled(true);
      } else {
        scrollStateProvider.setTopScrollButtonEnabled(false);
      }
    }
    if (!isBotScrollButtonLocked) {
      if (innerOffset <= innerController.position.maxScrollExtent - 50) {
        scrollStateProvider.setBotScrollButtonEnabled(true);
      } else {
        scrollStateProvider.setBotScrollButtonEnabled(false);
      }
    }
  }

  void _scrollToTop(bool outer, bool animateInner) {
    final scrollStateProvider =
        Provider.of<ScrollStateProvider>(context, listen: false);

    const duration = Duration(milliseconds: 500);
    const curve = Curves.easeInOut;

    if (innerController.hasClients &&
        innerController.positions.last.pixels != 0) {
      if (animateInner) {
        innerController.animateTo(
          0.0,
          duration: duration,
          curve: curve,
        );
      } else {
        Future.delayed(duration, () {
          innerController.jumpTo(0.0);
        });
      }
    }

    if (outerController.hasClients &&
        outerController.positions.last.pixels >=
            outerController.position.minScrollExtent) {
      if (outer) {
        if (animateInner) {
          outerController.animateTo(
            outerController.position.minScrollExtent,
            duration: duration,
            curve: curve,
          );
        } else {
          Future.delayed(duration, () {
            outerController.animateTo(
              outerController.position.minScrollExtent,
              duration: duration,
              curve: curve,
            );
          });
        }
      } else {
        if (animateInner) {
          outerController.animateTo(
            outerController.position.maxScrollExtent,
            duration: duration,
            curve: curve,
          );
        } else {
          Future.delayed(duration, () {
            outerController.animateTo(
              outerController.position.maxScrollExtent,
              duration: duration,
              curve: curve,
            );
          });
        }
      }
    }
    scrollStateProvider.setBotScrollButtonEnabled(true);
    scrollStateProvider.setTopScrollButtonEnabled(false);
  }

  void _scrollToBottom(bool outer, bool animateInner) {
    const duration = Duration(milliseconds: 500);
    const curve = Curves.easeInOut;

    if (outerController.hasClients) {
      if (outer) {
        outerController.animateTo(
          outerController.position.maxScrollExtent,
          duration: duration,
          curve: curve,
        );
      } else {
        outerController.animateTo(
          outerController.position.minScrollExtent,
          duration: duration,
          curve: curve,
        );
      }
    }
    double innerTargetOffset = innerController.position.maxScrollExtent;
    if (outerController.positions.last.pixels <=
        outerController.position.maxScrollExtent) {
      innerTargetOffset = innerController.position.maxScrollExtent -
          outerController.position.maxScrollExtent;
    }
    if (animateInner) {
      if (innerController.hasClients) {
        if (innerController.position.maxScrollExtent > 1000) {
          innerController.animateTo(
            innerTargetOffset,
            duration: Duration(milliseconds: 2000),
            curve: curve,
          );
        } else {
          innerController.animateTo(
            innerTargetOffset,
            duration: duration,
            curve: curve,
          );
        }
      } else {
        innerController.jumpTo(0.0);
      }
    }
  }

  void _resetToHome(bool animateInner) {
    _scrollToTop(true, animateInner);

    setState(() {
      MainTab.mainTabMode = 0;
      dynamicLogo = "assets/images/logo2.png";
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _selectedHeroTag = null;
        });
      });
    });

    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _tabController.animateTo(0);
  }

  void _onItemTapped(String heroTag) {
    HomeScreen.previousIndex = 1;
    if (heroTag == "Sushis") {
      _scrollToTop(true, true);

      setState(() {
        MainTab.mainTabMode = 1;
      });
    } else if (heroTag == "Warme Küche") {
      _scrollToTop(true, true);
      setState(() {
        MainTab.mainTabMode = 2;
      });
    } else {
      _scrollToTop(true, false);
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
    _scrollToTop(true, false);

    HomeScreen.previousIndex = 0;
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
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);
    final scrollStateProvider = Provider.of<ScrollStateProvider>(context);

    double logicalWidth = MediaQuery.of(context).size.width;

    if (_tabController.index == 0) {
      appBarTitle =
          "Willkommen in Sushi Yana ${branchProvider.branchData["name"]}!";
    } else if (_tabController.index == 1 &&
        (_selectedHeroTag != null && _selectedHeroTag != "null")) {
      appBarTitle = "$_selectedHeroTag";
    } else {
      appBarTitle =
          "Willkommen in Sushi Yana ${branchProvider.branchData["name"]}!";
    }

    Color indicatorColor =
        (_tabController.index == 1) ? yanaColor : Colors.white;

    Color unselectedLabelColor = (_tabController.index == 1)
        ? const Color.fromARGB(255, 127, 127, 127)
        : Colors.black;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: tabBackground,
        bottomNavigationBar: Footer(
          onResetHome: () =>
              _resetToHome(_tabController.index == 0 ? true : false),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: false,
          key: scrollControlerKey,
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
                    onTap: (value) {
                      if (value == 0 && HomeScreen.previousIndex == 1) {
                        _scrollToTop(true, false);
                      }
                      if (value == 1 && HomeScreen.previousIndex == 0) {
                        _scrollToTop(true, false);
                      }

                      if (value == 0 && HomeScreen.previousIndex == 0) {
                        // _resetToHome(true);

                        if (MainTab.mainTabMode == 1 ||
                            MainTab.mainTabMode == 2) {
                          MainTab.mainTabMode = 0;
                          _scrollToTop(true, true);
                        } else {
                          _scrollToTop(true, true);
                        }
                      }

                      if (value == 1 && HomeScreen.previousIndex == 1) {
                        _scrollToTop(true, true);
                      }

                      HomeScreen.previousIndex = value;
                    },
                  ),
                  _tabController.index,
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController.animateTo(index);

                    if (index == 0) {
                      _onBack();
                    } else {
                      _onItemTapped(_selectedHeroTag ?? "null");
                    }

                    _scrollToTop(true, false);
                    scrollStateProvider.setBotScrollButtonEnabled(true);
                  },
                  children: [
                    MainTab(
                      onItemTapped: _onItemTapped,
                      scrollToTopOnBack: () => _scrollToTop(true, true),
                    ),
                    _selectedHeroTag == null || _selectedHeroTag == "null"
                        ? EmptyTab(
                            onBack: _onBack,
                          )
                        : ItemsTab(
                            heroTag: _selectedHeroTag!,
                            onBack: _onBack,
                          ),
                  ],
                ),
                scrollStateProvider.isBotScrollButtonEnabled
                    ? _tabController.index == 1 &&
                            (_selectedHeroTag == null ||
                                _selectedHeroTag == "null") &&
                            innerOffset <
                                innerController.position.maxScrollExtent
                        ? SizedBox()
                        : Positioned(
                            bottom: 0,
                            right: logicalWidth > 650
                                ? logicalWidth / 2 - 45 - 300
                                : -18,
                            child: GestureDetector(
                              onTap: () {
                                _scrollToBottom(true, true);

                                setState(() {
                                  scrollStateProvider
                                      .setBotScrollButtonEnabled(false);
                                  isBotScrollButtonLocked = true;
                                });

                                Future.delayed(Duration(milliseconds: 2000),
                                    () {
                                  if (mounted) {
                                    setState(() {
                                      isBotScrollButtonLocked = false;
                                    });
                                  }
                                });
                              },
                              child: SizedBox(
                                  width: 70,
                                  child: LottieAnimationDuration(
                                      duration: Duration(seconds: 3),
                                      path:
                                          "assets/animations/scroll_down_white.json")),
                            ),
                          )
                    : SizedBox(),
                scrollStateProvider.isTopScrollButtonEnabled
                    ? _tabController.index == 1 &&
                            _selectedHeroTag == null &&
                            _selectedHeroTag == "null"
                        ? SizedBox()
                        : Positioned(
                            top: 80,
                            right: logicalWidth > 650
                                ? logicalWidth / 2 - 45 - 300
                                : -18,
                            child: GestureDetector(
                              onTap: () {
                                _scrollToTop(true, true);
                                scrollStateProvider
                                    .setTopScrollButtonEnabled(false);
                                setState(() {
                                  isTopScrollButtonLocked = true;
                                });

                                Future.delayed(Duration(milliseconds: 500), () {
                                  if (mounted) {
                                    setState(() {
                                      isTopScrollButtonLocked = false;
                                    });
                                  }
                                });
                              },
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: SizedBox(
                                  width: 70,
                                  child: LottieAnimationDuration(
                                      duration: Duration(seconds: 3),
                                      path:
                                          "assets/animations/scroll_down_white.json"),
                                ),
                              ),
                            ),
                          )
                    : SizedBox(),
                _tabController.index == 1
                    ? _selectedHeroTag == null || _selectedHeroTag == "null"
                        ? SizedBox()
                        : Positioned(
                            bottom: 10,
                            // MediaQuery.of(context).size.height / 2 - 100,

                            left: logicalWidth > 650
                                ? logicalWidth / 2 - 45 - 300
                                : -5,
                            child: GestureDetector(
                              onTap: () {
                                _onBack();
                              },
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: SizedBox(
                                  width: logicalWidth > 650 ? 70 : 45,
                                  child: LottieAnimationDuration(
                                      duration: Duration(seconds: 3),
                                      path:
                                          "assets/animations/scroll_down_white.json"),
                                ),
                              ),
                            ),
                          )
                    : SizedBox(),
              ],
            ),
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
