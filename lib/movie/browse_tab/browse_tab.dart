import 'package:flutter/material.dart';
import 'package:movies/model/Categories.dart';

import '../../api/api_manager.dart';
import '../../my_theme.dart';
import 'category_fragment.dart';

class BrowseTab extends StatefulWidget {
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Categories>(
              future: ApiManager.getNameOfCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.greyColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.3,
                        vertical: MediaQuery.of(context).size.height * 0.4),
                    child: Column(
                      children: [
                        Text(
                          'Something went wrong',
                          style: TextStyle(color: MyTheme.whiteColor),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(snapshot.error);
                            ApiManager.getNameOfCategory();
                            setState(() {});
                          },
                          child: Text('Try again'),
                        ),
                      ],
                    ),
                  );
                }

                /// response => ok-error
                if (snapshot.data?.genres == null) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.4,
                        top: MediaQuery.of(context).size.height * 0.4),
                    child: Column(
                      children: [
                        Text(
                          'Eroor' ?? "",
                          style: TextStyle(color: MyTheme.whiteColor),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ApiManager.getNameOfCategory();
                            setState(() {});
                          },
                          child: Text('Try again'),
                        ),
                      ],
                    ),
                  );
                }
                var categoriesList = snapshot.data?.genres ?? [];
                return Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: CategoryFragment(
                      categoriesNameList: categoriesList,
                    ));
              },
            ),
          )
        ],
      ),
    );
  }

//   Categories? selectedCategory;
//   void onCategoryClick(Categories newSelectedCategory) {
//     selectedCategory = newSelectedCategory;
//
//     setState(() {});
//   }
// }
}