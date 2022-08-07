import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  TabController? tabController;
  int? activeTabIndex = 0;
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
    return Column(children: [
      TabBar(
          controller: tabController,
          labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blueAccent,
          ),
          tabs: [
            Container(
              height: height / 30,
              child:
                  const Align(alignment: Alignment.center, child: Text('TÜMÜ')),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color:
                        activeTabIndex != 0 ? Colors.grey : Colors.transparent),
              ),
            ),
            Container(
              height: height / 30,
              child: const Align(
                  alignment: Alignment.center, child: Text('OKUNMAMIŞ')),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color:
                        activeTabIndex != 1 ? Colors.grey : Colors.transparent),
              ),
            ),
            Container(
              height: height / 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color:
                        activeTabIndex != 2 ? Colors.grey : Colors.transparent),
              ),
              child: const Align(
                  alignment: Alignment.center, child: Text('YILDIZLI')),
            ),
          ]),
      Expanded(
        child: TabBarView(controller: tabController, children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              children: [
                Container(
                  width: width / 1.15,
                  height: height / 9,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Color(0xffE2E9F4), spreadRadius: 1)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: height / 16, //17 olacak
                              width: width / 8,

                              decoration: BoxDecoration(
                                  color: const Color(0xff3663F2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "AS",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Task Examples",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                    const Text(
                                      "Dear YARTU team lorem ipsum dolor sit amet...",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width / 5,
                                height: height / 28,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.paperclip,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: height / 200,
                                  ),
                                  const Text(
                                    "1 November 2021 . 14.55",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                  const Text(
                                    "cihat@YARTU.io",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Container(
                  width: width / 1.15,
                  height: height / 9,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Color(0xffE2E9F4), spreadRadius: 1)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: height / 16, //17 olacak
                              width: width / 8,

                              decoration: BoxDecoration(
                                  color: const Color(0xff3663F2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "ÖŞ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Landing pages design",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                    const Text(
                                      "Dear YARTU team lorem ipsum dolor sit amet...",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width / 5,
                                height: height / 28,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.paperclip,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: height / 200,
                                  ),
                                  const Text(
                                    "1 November 2021 . 14.55",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                  const Text(
                                    "cihat@YARTU.io",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Container(
                  width: width / 1.15,
                  height: height / 9,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Color(0xffE2E9F4), spreadRadius: 1)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: height / 16, //17 olacak
                              width: width / 8,

                              decoration: BoxDecoration(
                                  color: const Color(0xff3663F2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(
                                    "assets/images/8.png",
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "YARTU Ui",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                    const Text(
                                      "Dear YARTU team lorem ipsum dolor sit amet...",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width / 5,
                                height: height / 28,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.paperclip,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: height / 200,
                                  ),
                                  const Text(
                                    "1 November 2021 . 14.55",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                  const Text(
                                    "cihat@YARTU.io",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Container(
                  width: width / 1.15,
                  height: height / 9,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Color(0xffE2E9F4), spreadRadius: 1)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: height / 16, //17 olacak
                              width: width / 8,

                              decoration: BoxDecoration(
                                  color: const Color(0xff3663F2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "CH",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Fundamentals of ai",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                    const Text(
                                      "Dear YARTU team lorem ipsum dolor sit amet...",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width / 5,
                                height: height / 28,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.paperclip,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: height / 200,
                                  ),
                                  const Text(
                                    "1 November 2021 . 14.55",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                  const Text(
                                    "cihat@YARTU.io",
                                    style: TextStyle(
                                        fontSize: 6, color: Color(0xff394C66)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
          ),
          MaterialButton(
            onPressed: () {},
            child: const Text('print'),
          ),
        ]),
      ),
    ]);
  }
}
