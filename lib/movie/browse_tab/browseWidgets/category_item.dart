import 'package:flutter/material.dart';
import '../../../api/api_constants.dart';
import '../category.dart';

class CategoryItem extends StatelessWidget {
  // var sourcesList;
  int index;

  // Category category;
  var category;

  CategoryItem({required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    // var categoriesList = snapshot.data?.results ?? [];

    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Image.network('${ApiConstants.imagePath}${categoryList[index].posterPath}',),

          // Image.network('${ApiConstants.imagePath}${sourcesList[index].posterPath}'),

          // Text('${category.id}'),
          Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
