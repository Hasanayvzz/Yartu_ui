import 'package:flutter/material.dart';

AppBar buildAppBar(void Function() onTap, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    title: InkWell(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
        child: SizedBox(
          height: 35,
          width: 50,
          child: Icon(
            Icons.menu,
            color: Color(0xff9AA1B4),
          ),
        ),
      ),
    ),
    actions: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 13),
            width: width * .65,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(2.0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff9AA1B4),
                ),
                hintText: "Search...",
                hintStyle: const TextStyle(color: Color(0xff9AA1B4)),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Color(0xff9AA1B4)),
                ),
              ),
            ),
          ),
        ],
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 1, 10),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              radius: 20,
              child: Text(
                "AŞ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Positioned(
              top: 1,
              right: 2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 5,
                minRadius: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  maxRadius: 3,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}
