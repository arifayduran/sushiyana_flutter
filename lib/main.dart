import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

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

class Extras {
  int artikelnummer;
  String artikelname;

  Extras(this.artikelnummer, this.artikelname);
}

List<Extras> extrasList = [];

Future<void> fetchExtras() async {
  // Database configuration parameters
  final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: null,
    db: 'db105950',
  );

  // Connect to the database
  final conn = await MySqlConnection.connect(settings);

  // Execute query
  var results = await conn.query('SELECT * FROM `extras`');

  // Populate extrasList with results
  for (var row in results) {
    extrasList.add(Extras(row[1], row[2]));
  }

  // Close connection
  await conn.close();
}

void main() {
  fetchExtras();
  debugPrint(extrasList.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: yanaColor,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  String? _selectedHeroTag;

  void _onItemTapped(String heroTag) {
    setState(() {
      _selectedHeroTag = heroTag;
    });
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onBack() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: const ImpressumBar(),
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
          body: PageView(
            controller: _pageController,
            children: [
              HomeTab(onItemTapped: _onItemTapped),
              if (_selectedHeroTag != null)
                SecondTab(heroTag: _selectedHeroTag!, onBack: _onBack),
            ],
          ),
        ),
      ),
    );
  }
}

class ImpressumBar extends StatelessWidget {
  const ImpressumBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      color: yanaColor,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
  final Function(String) onItemTapped;

  const HomeTab({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
      constraints: const BoxConstraints(maxWidth: 500),
      alignment: Alignment.topCenter,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 20),
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
                      highlightColor: yanaColor.withValues(alpha: .5),
                      splashColor: yanaColor,
                      onTap: () => onItemTapped(title),
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
  final VoidCallback onBack;

  const SecondTab({super.key, required this.heroTag, required this.onBack});

  @override
  Widget build(BuildContext context) {
    String imagePath = _mainItems[heroTag]!;
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: extrasList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(extrasList[index].artikelnummer.toString(),
                        textAlign: TextAlign.end,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white)),
                    trailing: Text(extrasList[index].artikelname,
                        textAlign: TextAlign.start,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white)),
                  );
                }),
          ),
          const Divider(
            color: Colors.white,
            height: 40,
            thickness: 0.2,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: onBack,
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(yanaColor),
                    elevation: WidgetStateProperty.all(5),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shadowColor: WidgetStateProperty.all(yanaColor)),
                child: const Icon(Icons.arrow_back_ios_new)),
          ),
        ],
      ),
    );
  }
}
