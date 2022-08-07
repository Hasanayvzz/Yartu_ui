import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  TabController? tabController;
  int? activeTabIndex = 0;
  int showBorder = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    tabController?.addListener(() {
      setState(() {
        activeTabIndex = tabController?.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: TabBar(
              controller: tabController,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueAccent,
              ),
              tabs: [
                Container(
                  height: height / 30,
                  child: const Align(
                      alignment: Alignment.center, child: Text('TÜMÜ')),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: activeTabIndex != 0
                            ? Colors.grey
                            : Colors.transparent),
                  ),
                ),
                Container(
                  height: 30,
                  child: const Align(
                      alignment: Alignment.center, child: Text('OKUNMAMIŞ')),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: activeTabIndex != 1
                            ? Colors.grey
                            : Colors.transparent),
                  ),
                ),
                Container(
                  height: height / 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: activeTabIndex != 2
                            ? Colors.grey
                            : Colors.transparent),
                  ),
                  child: const Align(
                      alignment: Alignment.center, child: Text('YILDIZLI')),
                ),
              ]),
          key: scaffoldKey,
          body: TabBarView(
            controller: tabController,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18, top: 18, bottom: 8),
                    child: Container(
                      width: width / 1.15,
                      height: height / 9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE2E9F4)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 0),
                                    child: Text("1 November 2021 • 14.55"),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 5),
                                    child: Text(
                                      "YARTU Ui",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Container(
                                      height: height / 12.75, //17 olacak
                                      width: width / 6,

                                      decoration: BoxDecoration(
                                        color: const Color(0xff3663F2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: FittedBox(
                                        child:
                                            Image.asset("assets/images/55.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18, bottom: 8),
                    child: Container(
                      width: width / 1.15,
                      height: height / 9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE2E9F4)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 0),
                                    child: Text(
                                      "1 October 2021 • 18.34",
                                      style:
                                          TextStyle(fontFamily: 'AvenirNext'),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 5),
                                    child: Text(
                                      "YARTU Tasks",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 6),
                                    child: Text("1 photo",
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: 'AvenirNext')),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Container(
                                      height: height / 12.75, //17 olacak
                                      width: width / 6,

                                      decoration: BoxDecoration(
                                        color: const Color(0xff3663F2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: FittedBox(
                                        child:
                                            Image.asset("assets/images/55.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18, bottom: 8),
                    child: Container(
                      width: width / 1.15,
                      height: height / 9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE2E9F4)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 0),
                                    child: Text(
                                      "1 December 2021 • 9.15",
                                      style:
                                          TextStyle(fontFamily: 'AvenirNext'),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 5),
                                    child: Text(
                                      "Lorem İpsum",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 6),
                                    child: Text("4 pdfs",
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: 'AvenirNext')),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Container(
                                      height: height / 12.75, //17 olacak
                                      width: width / 6,

                                      decoration: BoxDecoration(
                                        color: const Color(0xff3663F2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: FittedBox(
                                        child:
                                            Image.asset("assets/images/55.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18, bottom: 8),
                    child: Container(
                      width: width / 1.15,
                      height: height / 9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE2E9F4)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 0),
                                    child: Text(
                                      "1 January 2022 • 12.11",
                                      style:
                                          TextStyle(fontFamily: 'AvenirNext'),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 5),
                                    child: Text(
                                      "WHY & Benefits",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 6),
                                    child: Text("2 photos",
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: 'AvenirNext')),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Container(
                                      height: height / 12.75, //17 olacak
                                      width: width / 6,

                                      decoration: BoxDecoration(
                                        color: const Color(0xff3663F2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: FittedBox(
                                        child:
                                            Image.asset("assets/images/55.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18, bottom: 8),
                    child: Container(
                      width: width / 1.15,
                      height: height / 9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE2E9F4)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 0),
                                    child: Text(
                                      "13 January 2022 • 11.43",
                                      style:
                                          TextStyle(fontFamily: 'AvenirNext'),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.0, top: 5),
                                    child: Text(
                                      "Public api",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 6),
                                    child: Text("1 photo",
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: 'AvenirNext')),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Container(
                                      height: height / 12.75, //17 olacak
                                      width: width / 6,

                                      decoration: BoxDecoration(
                                        color: const Color(0xff3663F2),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: FittedBox(
                                        child:
                                            Image.asset("assets/images/55.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Text("data"),
              const Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
