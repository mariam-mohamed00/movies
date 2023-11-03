import 'package:flutter/material.dart';
import 'package:movies/model/BrowseCategories.dart';
import 'package:movies/model/Categories.dart';

import '../../api/api_manager.dart';
import '../../my_theme.dart';

class CategortDetails extends StatefulWidget {
  // Category category;
  // var categoriesList;
  Categories categoriesNameList;
  int index;

  CategortDetails({
    required this.index,
    required this.categoriesNameList,
  });

  @override
  State<CategortDetails> createState() => _CategortDetailsState();
}

class _CategortDetailsState extends State<CategortDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BrowseCategories>(
      future: ApiManager.getBrowseCategories(
          widget.categoriesNameList.genres?[widget.index].id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryLight,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'Something went wrong',
              ),
              ElevatedButton(
                onPressed: () {
                  // ApiManager.getBrowseCategories();
                  setState(() {});
                },
                child: Text('Try again'),
              ),
            ],
          );
        }

        /// response => (status) ok-error
        if (snapshot.data?.page != 1) {
          // code, message
          return Column(
            children: [
              Text(snapshot.data?.status_message ?? ""),
              ElevatedButton(
                onPressed: () {
                  // ApiManager.getBrowseCategories();
                  setState(() {});
                },
                child: Text('Try again'),
              ),
            ],
          );
        }
        var categoriesList = snapshot.data?.results ?? [];
        return Column(children: [
          ListView.builder(
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(categoriesList[index].title ?? ''),
                    Text('kN'),
                    Text('kN'),
                  ],
                );
              })
        ]);
      },
    );
  }
}
