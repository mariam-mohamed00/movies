import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../model/NewReleases.dart';
import '../../my_theme.dart';
import '../customWidgets/movie_item.dart';

class CategortDetails extends StatefulWidget {
  var categoriesList;
  int index;

  CategortDetails({
    required this.index,
    required this.categoriesList,
  });

  @override
  State<CategortDetails> createState() => _CategortDetailsState();
}

class _CategortDetailsState extends State<CategortDetails> {
  @override
  Widget build(BuildContext context) {
    CategortDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as CategortDetailsArgs;

    return Scaffold(
      backgroundColor: MyTheme.primaryLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.18),
          child: Text(
            '${widget.categoriesList[widget.index].name}',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      body: FutureBuilder<MoviesResponse>(
        future: ApiManager.getBrowseCategories(args.categoryId),
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
                  style: TextStyle(color: MyTheme.whiteColor),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(snapshot.error);
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
            Expanded(
                child: ListView.builder(
                    itemCount: categoriesList.length,
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        MovieItem(
                          moviesList: categoriesList,
                          itemIndex: index,
                        ),
                      ]);
                    })),
          ]);
        },
      ),
    );
  }
}

class CategortDetailsArgs {
  int categoryId;

  CategortDetailsArgs({
    required this.categoryId,
  });
}
