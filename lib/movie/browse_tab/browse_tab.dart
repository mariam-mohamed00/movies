import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/model/BrowseCategories.dart';
import 'package:movies/model/Categories.dart';

import '../../api/api_manager.dart';
import '../../my_theme.dart';
import 'category.dart';
import 'category_datails.dart';

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
          //   Expanded(
          //     child: FutureBuilder<BrowseCategories>(
          //     future: ApiManager.getBrowseCategories(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(
          //             color: MyTheme.primaryLight,
          //           ),
          //         );
          //       } else if (snapshot.hasError) {
          //         return Padding(
          //           padding: const EdgeInsets.only(left:130.0, top: 350),
          //           child: Column(
          //             children: [
          //               Text(
          //                 'Something went wrong', style: TextStyle(color: MyTheme.whiteColor),
          //               ),
          //               ElevatedButton(
          //                 onPressed: () {
          //                   print('EROOOOOOOOR');
          //                   ApiManager.getBrowseCategories();
          //                   setState(() {});
          //                 },
          //                 child: Text('Try again'),
          //               ),
          //             ],
          //           ),
          //         );
          //       }
          //
          //       /// response => (status) ok-error
          //       if (snapshot.data?.page != 1) {
          //         // code, message
          //         return Column(
          //           children: [
          //             Text('Eroor' ?? ""),
          //             ElevatedButton(
          //               onPressed: () {
          //                 ApiManager.getBrowseCategories();
          //                 setState(() {});
          //               },
          //               child: Text('Try again'),
          //             ),
          //           ],
          //         );
          //       }
          //       // var sourcesList = snapshot.data?.results ?? [];
          //       var categoriesList = snapshot.data?.results ?? [];
          //       return Padding(
          //         padding: const EdgeInsets.all(48.0),
          //         // child: Text(sourcesList[index].title ?? '')
          //         child:  CategoryFragment()
          //       );
          //     },
          // ),
          //   )

          // FutureBuilder<BrowseCategories>(
          //     future: ApiManager.getBrowseCategories(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(
          //             color: MyTheme.greyColor,
          //           ),
          //         );
          //       } else if (snapshot.hasError) {
          //         return Padding(
          //           padding: const EdgeInsets.all(40.0),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(
          //                   // '${ snapshot.data?.status_message }'
          //                   'something went wrong',
          //                   style: TextStyle(color: Colors.white)),
          //               ElevatedButton(
          //                   onPressed: () {
          //                     print(snapshot.data?.status_message);
          //                     ApiManager.getBrowseCategories();
          //                     setState(() {});
          //                   },
          //                   child: const Text(
          //                     'Try again',
          //                   ))
          //             ],
          //           ),
          //         );
          //       }
          //
          //       /// response => success / fail
          //       if (snapshot.data?.page != 1) {
          //         return Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Center(
          //                 child: Text(
          //               'error' ?? '',
          //               style: TextStyle(color: MyTheme.whiteColor),
          //             )),
          //             ElevatedButton(
          //                 onPressed: () {
          //                   print(snapshot.error);
          //                 },
          //                 child: Text('Try again'))
          //           ],
          //         );
          //       }
          //       // var browseCategories = snapshot.data?.results ?? [];
          //       return Column(children: [
          //         const SizedBox(height: 32),
          //
          //         Center(child: Text('lu'))
          //         // CategoryFragment( ),
          //       ]);
          //     }),
        ],
      ),
    );
  }

// Category? selectedCategory;
//
// void onCategoryClick(Category newSelectedCategory) {
//   selectedCategory = newSelectedCategory;
//
//   setState(() {});
// }

// int selectedDrawerItem = 1;
}
