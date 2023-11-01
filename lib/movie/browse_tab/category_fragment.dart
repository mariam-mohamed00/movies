import 'package:flutter/material.dart';
import 'browseWidgets/category_item.dart';
import 'category.dart';

class CategoryFragment extends StatelessWidget {
  // var sourcesList;
  // var categories;
  // CategoryFragment({required this.categories});

  // Function onCategoryClick;
  var categories = Category.getCategories();

  // Function onCategoryClick;

  // CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Browse Category',
              style: Theme.of(context).textTheme.titleLarge),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 38),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      // return CategortDetails();
                      // onCategoryClick(categories[index]);
                    },
                    child: CategoryItem(
                        category: categories[index],
                        // sourcesList: sourcesList[index],
                        index: index));
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
