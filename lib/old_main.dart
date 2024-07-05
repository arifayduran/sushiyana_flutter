import 'package:flutter/material.dart';

const Map<String, String> _mainItems = {
  "Suppen": 'assets/images/startseite/suppe.jpg',
  "Vorspeisen": 'assets/images/startseite/vorspeise.jpg',
  "Salate": 'assets/images/startseite/salat.jpg',
  "Sommerrollen": 'assets/images/startseite/sommerrolle.jpg',
  "Sushis": 'assets/images/startseite/sushi.jpg',
  "Warme Kücke": 'assets/images/startseite/warme.jpg',
  "Bowls": 'assets/images/startseite/bowl.jpg',
  "Desserts": 'assets/images/startseite/dessert.jpg',
  "Getränke": 'assets/images/startseite/getraenke.jpg',
  "Extras": 'assets/images/startseite/extras.jpg',
};

const Color yanaColor = Color.fromARGB(255, 106, 36, 119);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomSheet: const MyBottomSheet(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                toolbarHeight: 40,
                floating: false,
                pinned: true,
                stretch: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(3),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: const Text(
                    "Willkommen bei Sushi Yana",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                  background: Image.asset(
                    "assets/images/logo2.png", cacheHeight: 200,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    indicatorWeight: 6,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: _tabs,
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: const TabBarView(
            children: [
              HomeTab(),
              Text(
                "Profile",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
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
      Icons.home_rounded,
    ),
  ),
  Tab(
    icon: Icon(Icons.shopping_bag_rounded),
  ),
];

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: yanaColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      constraints: const BoxConstraints(maxWidth: 500),
      alignment: Alignment.topCenter,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemCount: _mainItems.length,
        itemBuilder: (BuildContext context, int index) {
          String title = _mainItems.keys.elementAt(index);
          String imagePath = _mainItems.values.elementAt(index);
          return Container(
            margin: const EdgeInsets.all(10),
            clipBehavior: Clip.hardEdge,
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: yanaColor,
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Hero(
                      tag: title,
                      child: Image.asset(
                        imagePath,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: yanaColor.withOpacity(.5),
                      splashColor: yanaColor,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SecondTab(heroTag: title),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: yanaColor,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  final String heroTag;

  const SecondTab({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    String imagePath = _mainItems[heroTag]!;
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imagePath),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              "Content goes here",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: yanaColor,
      height: 30,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Zurück zur Startseite",
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
          const Text(
            "-",
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Impressum",
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
          const Text(
            "-",
            style: TextStyle(fontSize: 9, color: Colors.white),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Datenschutz",
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
