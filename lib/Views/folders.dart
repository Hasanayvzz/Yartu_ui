import 'package:flutter/material.dart';

class Folder extends StatefulWidget {
  const Folder({Key? key}) : super(key: key);

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scaffold(
            resizeToAvoidBottomInset: false,
            key: scaffoldKey,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 22),
                  child: Text(
                    "Folders",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff394C66),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: (itemWidth * 5 / itemHeight),
                  ),
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE2E9F4)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "1 November 2021 • 14.55",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: height * .009,
                                ),
                                const Text(
                                  "YARTU Ui",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  primary: false,
                  padding: const EdgeInsets.all(20),
                ),
              ],
            )),
      ),
    );
  }
}
