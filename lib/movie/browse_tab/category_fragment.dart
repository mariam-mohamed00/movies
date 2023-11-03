import 'package:flutter/material.dart';

import 'browseWidgets/category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesNameList;

  // Function onCategoryClick;
  CategoryFragment({
    required this.categoriesNameList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Browse Category', style: Theme.of(context).textTheme.titleLarge),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    // onCategoryClick(categoriesNameList[index]);
                  },
                  child: CategoryItem(
                      categoriesNameList: categoriesNameList, index: index));
            },
            itemCount: categoriesNameList.length,
          ),
        ),
      ],
    );
  }
}
