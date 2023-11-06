import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  var categoriesNameList;
  int index;

  CategoryItem({
    required this.categoriesNameList,
    required this.index,
    // required this.categoryId
  });

  List<String> img = [
    'assets/images/action_image.png',
    'assets/images/adventure.png',
    'assets/images/animation.jpg',
    'assets/images/comedy.jpg',
    'assets/images/crime.jpg',
    'assets/images/documentary.jpg',
    'assets/images/drama.jpg',
    'assets/images/family.jpg',
    'assets/images/fantasy.jpg',
    'assets/images/history.jpg',
    'assets/images/horror.png',
    'assets/images/music.jpg',
    'assets/images/mystery.jpg',
    'assets/images/romance.jpg',
    'assets/images/science_fiction.jpg',
    'assets/images/tv.jpg',
    'assets/images/thriller.png',
    'assets/images/war.png',
    'assets/images/western.jpg',
  ];

  String defaultImg = 'assets/images/default_backgroung_image.jpg';

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(widget.img[widget.index], errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset(widget.defaultImg,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity);
        }, fit: BoxFit.fill, width: double.infinity, height: double.infinity),
        Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 50,
          child: Text(
            widget.categoriesNameList[widget.index].name ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
