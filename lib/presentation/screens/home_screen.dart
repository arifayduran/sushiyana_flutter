import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/providers/branch_provider.dart';
import 'package:sushiyana_flutter/application/services/fetch_data_with_retry.dart';
import 'package:sushiyana_flutter/application/get_image_url_cdn.dart';
import 'package:sushiyana_flutter/application/providers/scroll_state_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/data/is_data_fetched_notifier.dart';
import 'package:sushiyana_flutter/data/local_database.dart';
import 'package:sushiyana_flutter/presentation/widgets/animated_text_widget.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/fancy_cart_button.dart';
import 'package:sushiyana_flutter/presentation/screens/footer.dart';
import 'package:sushiyana_flutter/presentation/widgets/lottie_animation_duration.dart';
import 'package:sushiyana_flutter/presentation/screens/tabs/items_tab.dart';
import 'package:sushiyana_flutter/presentation/screens/tabs/main_tab.dart';

final GlobalKey<NestedScrollViewState> scrollControlerKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static int previousIndex = 0;
  static double botPadding = 35;
  static double topPadding = 0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//  isBotScrollButtonEnabled = true; in maintabs

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  String? _selectedHeroTag;

  double _innerOffset = 0;

  late AnimationController _pulsingController;

  String _dynamicLogo = "assets/images/logo2.png";
  String _appBarTitle = "Willkommen in Sushi Yana!";

  // bool isTopScrollButtonEnabled = false;
  bool _isTopScrollButtonLocked = false;

  // bool isBotScrollButtonEnabled = true;
  bool _isBotScrollButtonLocked = false;

  bool _isControllerInitialized = false;
  bool _isFetchingData = true;
  // bool _isFirstAnimationDone = false;

  ScrollController get outerController {
    if (scrollControlerKey.currentState == null) {
      throw Exception("NestedScrollView's state is not initialized yet.");
    }
    return scrollControlerKey.currentState!.outerController;
  }

  ScrollController get innerController {
    if (scrollControlerKey.currentState == null) {
      throw Exception("NestedScrollView's state is not initialized yet.");
    }
    return scrollControlerKey.currentState!.innerController;
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (mounted) {
        setState(() {
          if (_tabController.index == 0) {
            _dynamicLogo = "assets/images/logo2.png";
          } else {
            _dynamicLogo = getHeroImagePath(_selectedHeroTag ?? "");
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

    _pulsingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Pulsfrequenz
      lowerBound: 0.8,
      upperBound: 1,
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _isFetchingData = true;
      });
      await fetchDataWithRetry(context);
      setState(() {
        _isFetchingData = false;
      });
      // _scrollToTop(true, true);

      _isControllerInitialized = true;

      innerController.addListener(() {
        if (mounted) {
          _updateScrollState();
        }
      });
      // _isFirstAnimationDone = true;
    });
  }

  void _updateScrollState() {
    final scrollStateProvider =
        Provider.of<ScrollStateProvider>(context, listen: false);

    if (!innerController.hasClients) return;

    setState(() {
      _innerOffset = innerController.positions.last.pixels;
    });

    if (!_isTopScrollButtonLocked) {
      scrollStateProvider.setTopScrollButtonEnabled(_innerOffset > 0);
    }

    if (!_isBotScrollButtonLocked) {
      scrollStateProvider.setBotScrollButtonEnabled(
        _innerOffset <= innerController.position.maxScrollExtent - 50,
      );
    }
  }

  void _scrollToTop(bool outer, bool animateInner) {
    setState(() {
      ItemsTab.lockItemsTabFiltersPadding = true;
    });

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

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        ItemsTab.lockItemsTabFiltersPadding = false;
      });
    });
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
    // double innerTargetOffset = innerController.position.maxScrollExtent;
    // if (outerController.positions.last.pixels <=
    //     outerController.position.maxScrollExtent) {
    //   innerTargetOffset = innerController.position.maxScrollExtent -
    //       outerController.position.pixels;
    // }
    if (animateInner) {
      if (innerController.hasClients) {
        if (innerController.position.maxScrollExtent > 1000) {
          innerController.animateTo(
            // innerTargetOffset,
            innerController.position.maxScrollExtent,
            duration: Duration(milliseconds: 2000),
            curve: curve,
          );
        } else {
          innerController.animateTo(
            // innerTargetOffset,
            innerController.position.maxScrollExtent,
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
      _dynamicLogo = "assets/images/logo2.png";
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
      _dynamicLogo = "assets/images/logo2.png";
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

  void _onTabChange() {
    if (mounted) {
      setState(() {
        if (_tabController.index == 0) {
          _dynamicLogo = "assets/images/logo2.png";
        } else {
          _dynamicLogo = getHeroImagePath(_selectedHeroTag ?? "");
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChange);
    _tabController.dispose();
    _pageController.dispose();
    _pulsingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);

    final scrollStateProvider = Provider.of<ScrollStateProvider>(context);

    double logicalWidth = MediaQuery.of(context).size.width;

    if (_tabController.index == 0) {
      _appBarTitle =
          "Willkommen in Sushi Yana ${branchProvider.branches[branchProvider.currentBranch]!["display_name"] ?? branchProvider.branches[branchProvider.currentBranch]!["name"]}!";
    } else if (_tabController.index == 1 &&
        (_selectedHeroTag != null && _selectedHeroTag != "null")) {
      _appBarTitle = _selectedHeroTag!.toUpperCase();
    } else {
      _appBarTitle =
          "Willkommen in Sushi Yana ${branchProvider.branches[branchProvider.currentBranch]!["display_name"] ?? branchProvider.branches[branchProvider.currentBranch]!["name"]}!";
    }

    Color indicatorColor =
        (_tabController.index == 1) ? yanaColor : Colors.white;

    Color unselectedLabelColor = (_tabController.index == 1)
        ? const Color.fromARGB(255, 127, 127, 127)
        : Colors.black;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          if (_tabController.index == 0) {
            if (MainTab.mainTabMode == 2 || MainTab.mainTabMode == 1) {
              _scrollToTop(true, true);
              MainTab.mainTabMode = 0;
            } else {
              _scrollToTop(true, true);
            }
          } else {
            if (_selectedHeroTag != null && _selectedHeroTag != "null") {
              if (innerController.hasClients && outerController.hasClients) {
                if (innerController.offset == 0 &&
                    outerController.offset == 0) {
                  _onBack();
                }
                _scrollToTop(true, false);
              } else {
                debugPrint(
                    "ScrollController is not attached to any scroll views.");
              }
            } else {
              _onBack();
            }
          }
        });
        return false;
      },
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          backgroundColor: tabBackground,
          // bottomNavigationBar: Footer(
          //   onResetHome: () =>
          //       _resetToHome(_tabController.index == 0 ? true : false),
          // ),
          body: NestedScrollView(
            floatHeaderSlivers: false,
            key: scrollControlerKey,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                    title: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: AnimatedTextWidget(
                          text: _appBarTitle,
                          initColor: Colors.white,
                          hoverColor: Colors.white,
                          minSize: 20,
                          midSize: 15,
                          maxSize: 12,
                          fontFamily: "Julee",
                          enableFirstAnimation: true, // !_isFirstAnimationDone,
                          fontWeight: FontWeight.w100),
                    ),

                    //  Text(
                    //   _appBarTitle,
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontFamily: "Julee",
                    //       fontSize: 11.5,
                    //       fontWeight: FontWeight.w100),
                    // ),
                    background: GestureDetector(
                      onTap: () => _resetToHome(false),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: AnimatedSwitcher(
                          duration: const Duration(
                              milliseconds: 600), // Sanfter Wechsel
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: ScaleTransition(
                                  scale: animation, child: child),
                            );
                          },
                          child: AnimatedBuilder(
                            animation: _pulsingController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulsingController
                                    .value, // Endlose Puls-Animation
                                child: child,
                              );
                            },
                            child: _dynamicLogo == "assets/images/logo2.png"
                                ? Image.asset(
                                    _dynamicLogo,
                                    key: ValueKey<String>(_dynamicLogo),
                                    cacheHeight: 130,
                                  )
                                : Image.network(
                                    getImageUrlCdn(_dynamicLogo),
                                    key: ValueKey<String>(
                                        _dynamicLogo), // Logo-Wechsel auslösen
                                    cacheHeight: 130,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/noimage_sushiyana.jpg');
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) =>
                                            loadingProgress == null
                                                ? child
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: yanaColor,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              (loadingProgress
                                                                      .expectedTotalBytes ??
                                                                  1)
                                                          : null,
                                                    ),
                                                  ),
                                  ),
                          ),
                        ),
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
                        if (!isDataFetchedNotifier.value ||
                            _isFetchingData ||
                            !_isControllerInitialized) {
                          // Prevent tab bar interaction
                          _tabController.animateTo(0);
                        } else {
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
                        }
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
                      if (!isDataFetchedNotifier.value ||
                          _isFetchingData ||
                          !_isControllerInitialized) {
                        // Prevent swiping to other tabs
                        _pageController.jumpToPage(0);
                      } else {
                        _tabController.animateTo(index);

                        if (index == 0) {
                          _onBack();
                        } else {
                          _onItemTapped(_selectedHeroTag ?? "null");
                        }

                        _scrollToTop(true, false);
                        scrollStateProvider.setBotScrollButtonEnabled(true);
                      }
                    },
                    physics: (!isDataFetchedNotifier.value ||
                            _isFetchingData ||
                            !_isControllerInitialized)
                        ? const NeverScrollableScrollPhysics()
                        : null,
                    children: [
                      Stack(
                        children: [
                          MainTab(
                            onItemTapped: _onItemTapped,
                            scrollToTopOnBack: () => _scrollToTop(true, true),
                          ),
                          if (!isDataFetchedNotifier.value || _isFetchingData)
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                              child: Container(
                                color: Colors.black.withValues(
                                    alpha: !_isFetchingData &&
                                            !isDataFetchedNotifier.value
                                        ? 0.6
                                        : 0.2),
                              ),
                            ),
                          if (_isFetchingData)
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "Daten werden geladen...",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Julee",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (!_isFetchingData && !isDataFetchedNotifier.value)
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Icon(
                                        Icons.error_outline_outlined,
                                        color: yanaColor,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Daten konnten nicht geladen werden.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Julee",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Divider(
                                        color: Colors.white,
                                        thickness: 0.5,
                                        height: 12,
                                        endIndent: 25,
                                        indent: 25,
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                          radius: 6,
                                          backgroundColor: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        _isFetchingData = true;
                                      });

                                      await fetchDataWithRetry(context);

                                      setState(() {
                                        _isFetchingData = false;
                                      });
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(yanaColor),
                                        elevation: WidgetStateProperty.all(5),
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                                Colors.white),
                                        shadowColor:
                                            WidgetStateProperty.all(yanaColor)),
                                    child: const Text("Wiederholen"),
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      _selectedHeroTag == null || _selectedHeroTag == "null"
                          ? EmptyTab(
                              onBack: _onBack,
                            )
                          : ItemsTab(
                              heroTag: _selectedHeroTag!,
                              // onBack: _onBack,
                              outerController: outerController,
                              // innerController: innerController,
                            ),
                    ],
                  ),
                  scrollStateProvider.isBotScrollButtonEnabled
                      ? _tabController.index == 1 &&
                              (_selectedHeroTag == null ||
                                  _selectedHeroTag == "null") &&
                              (innerController.hasClients &&
                                  _innerOffset <
                                      innerController.position.maxScrollExtent)
                          ? SizedBox()
                          : Positioned(
                              bottom: _tabController.index == 1
                                  ? HomeScreen.botPadding
                                  : 35,
                              // right: logicalWidth > 650
                              //     ? logicalWidth / 2 - 45 - 300
                              //     : -18,
                              right: logicalWidth > 650
                                  ? logicalWidth > 1100
                                      ? logicalWidth / 2 - 70 - 500
                                      : -8
                                  : -18,
                              child: GestureDetector(
                                onTap: () {
                                  _scrollToBottom(true, true);

                                  setState(() {
                                    scrollStateProvider
                                        .setBotScrollButtonEnabled(false);
                                    _isBotScrollButtonLocked = true;
                                  });

                                  Future.delayed(Duration(milliseconds: 2000),
                                      () {
                                    if (mounted) {
                                      setState(() {
                                        _isBotScrollButtonLocked = false;
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
                              top: _tabController.index == 1
                                  ? HomeScreen.topPadding
                                  : 80,
                              // right: logicalWidth > 650
                              //     ? logicalWidth / 2 - 45 - 300
                              //     : -18,

                              right: logicalWidth > 650
                                  ? logicalWidth > 1100
                                      ? logicalWidth / 2 - 70 - 500
                                      : -8
                                  : -18,
                              child: GestureDetector(
                                onTap: () {
                                  _scrollToTop(true, true);
                                  scrollStateProvider
                                      .setTopScrollButtonEnabled(false);
                                  setState(() {
                                    _isTopScrollButtonLocked = true;
                                  });

                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    if (mounted) {
                                      setState(() {
                                        _isTopScrollButtonLocked = false;
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
                      // ? _selectedHeroTag == null || _selectedHeroTag == "null"
                      ? Positioned(
                          bottom: 135,
                          // bottom: 10,
                          // bottom: MediaQuery.of(context).size.height / 5,

                          // left: logicalWidth > 650
                          //     ? logicalWidth / 2 - 45 - 300
                          //     : -5,
                          left: logicalWidth > 650
                              ? logicalWidth > 1100
                                  ? logicalWidth / 2 - 70 - 500
                                  : 0
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

                  // : SizedBox(),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Footer(
                      onResetHome: () => _resetToHome(
                          _tabController.index == 0 ? true : false),
                    ),
                  ),
                  Positioned(
                    bottom: _tabController.index == 1
                        ? HomeScreen.botPadding
                        : 34.9,
                    right: 0,
                    left: 0,
                    child: FancyCartButton(
                      buttonFillColor: yanaColor,
                      height: 40,
                      size: 45,
                    ),
                  ),
                ],
              ),
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
