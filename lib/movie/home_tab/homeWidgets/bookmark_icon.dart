import 'package:flutter/material.dart';

import '../../../my_theme.dart';

class BookMarkIcon extends StatefulWidget {
  @override
  State<BookMarkIcon> createState() => _BookMarkIconState();
}

class _BookMarkIconState extends State<BookMarkIcon> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: check == false
          ? InkWell(
              onTap: () {
                check = !check;
                setState(() {});
              },
              child: Stack(children: [
                Image.asset(
                  'assets/images/Icon awesome-bookmark-grey.png',
                ),
                Icon(
                  Icons.add,
                  color: MyTheme.whiteColor,
                )
              ]),
            )
          : InkWell(
              onTap: () {
                check = !check;

                setState(() {});
              },
              child: Stack(children: [
                Image.asset(
                  'assets/images/Icon awesome-bookmark.png',
                ),
                Icon(
                  Icons.check,
                  color: MyTheme.whiteColor,
                )
              ]),
            ),
    );
  }
}
