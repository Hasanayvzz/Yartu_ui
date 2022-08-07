// ignore_for_file: avoid_print, non_constant_identifier_names, duplicate_ignore

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yartu/Model/drawerr.dart';
import 'package:yartu/Views/dashboard.dart';
import 'package:yartu/Views/details.dart';
import 'package:yartu/Views/folders.dart';
import 'package:yartu/Views/login.dart';
import 'package:yartu/Views/message.dart';
import 'Components/appbar.dart' as appbar;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YARTU",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/Home": ((context) => const MyHomePage()),
      },
      theme: ThemeData(
        fontFamily: 'Manrope',
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: duplicate_ignore
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 0;
  List<int> tabIndexHistory = [0];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 5, initialIndex: 0);
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool isSelected = false;
  void setSelected() {
    setState(() {
      isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        // ignore: duplicate_ignore
        if (tabIndexHistory.length != 1) {
          tabIndexHistory.removeLast();

          print(tabIndexHistory);
          activeTabIndex = tabIndexHistory.last;
          tabController.index = tabIndexHistory.last;

          print(tabIndexHistory.last);
          return deneme(5);
        } else {
          throw Null;
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appbar.buildAppBar(() {
            // ignore: duplicate_ignore
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.openEndDrawer();

              print(scaffoldKey.currentState!.isDrawerOpen);
            } else {
              scaffoldKey.currentState!.openDrawer();
              print(scaffoldKey.currentState!.isDrawerOpen);
            }
          }, context),
          body: Scaffold(
            resizeToAvoidBottomInset: false,
            key: scaffoldKey,
            drawer: CustomDrawer(width),
            body: Column(
              children: [
                Expanded(
                  child: Pages(),
                ),
                BottomTabBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BottomTabBar() {
    return Container(
      height: 48,
      color: const Color(0xffEFF4FA),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 67.5),
        child: TabBar(
            labelPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            controller: tabController,
            indicatorColor: Colors.transparent,
            tabs: [
              InkWell(
                onTap: () {
                  setState(() {
                    activeTabIndex = 0;
                    tabController.index = 0;
                    tabIndexHistory.add(0);
                    print(tabIndexHistory);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 2,
                        color: activeTabIndex == 0
                            ? const Color(0xff3663F2)
                            : Colors.transparent),
                  ),
                  child: Center(
                    child: ImageIcon(
                        const AssetImage(
                          "assets/images/envelope.png",
                        ),
                        color: activeTabIndex == 0
                            ? const Color(0xff3663F2)
                            : const Color(0xff394C66)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTabIndex = 1;
                    tabController.index = 1;
                    tabIndexHistory.add(1);
                    print(tabIndexHistory);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 2,
                        color: activeTabIndex == 1
                            ? const Color(0xff3663F2)
                            : Colors.transparent),
                  ),
                  child: Center(
                    child: ImageIcon(
                      const AssetImage(
                        "assets/images/template.png",
                      ),
                      color: activeTabIndex == 1
                          ? const Color(0xff3663F2)
                          : const Color(0xff394C66),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    activeTabIndex = 2;
                    tabController.index = 2;
                    tabIndexHistory.add(2);
                    print(tabIndexHistory);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 2,
                        color: activeTabIndex == 2
                            ? const Color(0xff3663F2)
                            : Colors.transparent),
                  ),
                  child: Center(
                    child: ImageIcon(
                        const AssetImage(
                          "assets/images/details.png",
                        ),
                        color: activeTabIndex == 2
                            ? const Color(0xff3663F2)
                            : const Color(0xff394C66)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    activeTabIndex = 3;
                    tabController.index = 3;
                    tabIndexHistory.add(3);
                    print(tabIndexHistory);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 2,
                        color: activeTabIndex == 3
                            ? const Color(0xff3663F2)
                            : Colors.transparent),
                  ),
                  child: Center(
                    child: ImageIcon(
                        const AssetImage(
                          "assets/images/folder.png",
                        ),
                        color: activeTabIndex == 3
                            ? const Color(0xff3663F2)
                            : const Color(0xff394C66)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    activeTabIndex = 4;
                    tabController.index = 4;
                    tabIndexHistory.add(4);
                    print(tabIndexHistory);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 2,
                        color: activeTabIndex == 4
                            ? const Color(0xff3663F2)
                            : Colors.transparent),
                  ),
                  child: Center(
                    child: ImageIcon(
                        const AssetImage(
                          "assets/images/options.png",
                        ),
                        color: activeTabIndex == 4
                            ? const Color(0xff3663F2)
                            : const Color(0xff394C66)),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  TabBarView Pages() {
    // ignore: prefer_const_literals_to_create_immutables
    return TabBarView(controller: tabController, children: [
      const Page1(),
      const Dashboard(),
      const FilePage(),
      const Folder(),
      const Center(
        child: Text("Boş Sayfa"),
      )
    ]);
  }

  // ignore: non_constant_identifier_names
  Container CustomDrawer(double width) {
    return Container(
      child: ListView.builder(
          itemCount: test.drawers.length,
          itemBuilder: (context, int index) {
            return Container(
              color: activeTabIndex == index
                  ? const Color(0xffEFF4FA)
                  : Colors.transparent,
              child: ListTile(
                selected: true,
                minLeadingWidth: 5,
                leading: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Visibility(
                      visible: activeTabIndex == index,
                      child: Positioned(
                        left: -17,
                        top: -15,
                        child: Center(
                          child: Container(
                            width: 4,
                            height: 55,
                            decoration: BoxDecoration(
                                color: const Color(0xff3663F2),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      test.drawers[index].image,
                      color: activeTabIndex == index
                          ? const Color(0xff3663F2)
                          : const Color(0xff394C66),
                    ),
                  ],
                ),
                title: Text(
                  test.drawers[index].text,
                  style: TextStyle(
                    color: activeTabIndex == index
                        ? const Color(0xff3663F2)
                        : const Color(0xff394C66),
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  setState(() {
                    activeTabIndex = index;
                    tabController.index = index;
                    tabIndexHistory.add(index);
                    print(tabIndexHistory);
                  });
                },
              ),
            );
          }),
      color: Colors.white,
      width: width / 2,
    );
  }

  deneme(int ix) {
    //print(ix);
  }
}
