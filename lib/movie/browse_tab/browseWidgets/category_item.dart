import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  var categoriesNameList;
  int index;

  // var categoriesList;
  CategoryItem({
    required this.categoriesNameList,
    required this.index,
    // required this.categoriesList
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: category.color,
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(199, 199, 178, 1.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // Image.network('${ApiConstants.imagePath}${popularList[widget.index].posterPath}'),

            Text(
              widget.categoriesNameList[widget.index].name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
