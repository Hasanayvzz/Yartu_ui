import 'package:flutter/material.dart';

class FilePage extends StatefulWidget {
  const FilePage({Key? key}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> with TickerProviderStateMixin {
  TabController? tabController;
  int? activeTabIndex = 0;
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
    var size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Manrope",
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Scaffold(
          key: scaffoldKey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5, left: 22),
                    child: Text(
                      "Items",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff394C66),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.file_upload),
                      onPressed: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12))),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: size.height / 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  // mainAxisSize: MainAxisSize.min,

                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "Upload",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(
                                              0xff394C66,
                                            )),
                                      ),
                                    ),
                                    ListTile(
                                      leading:
                                          Icon(Icons.insert_drive_file_sharp),
                                      title: Text(
                                        " Files",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff394C66)),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.folder_rounded),
                                      title: Text(
                                        " Folder",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff394C66)),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      label: const Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff2356F6)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ))),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(child: Image.asset("assets/images/file.png")),
                  const Text(
                    "Wow such a empty space.",
                    style: TextStyle(fontSize: 18, color: Color(0xff394C66)),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
