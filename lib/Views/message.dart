import 'package:flutter/material.dart';
import 'package:yartu/Components/tabbar.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
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
    return Column(
      children: const [Expanded(child: CustomTabBar())],
    );
  }
}
