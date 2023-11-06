import 'package:flutter/material.dart';
import 'package:movies/model/NewReleases.dart';
import 'package:movies/movie/customWidgets/bookmark_icon.dart';

import '../../api/api_constants.dart';
import '../../firebase/firebase_utils.dart';
import '../../my_theme.dart';
import '../home_tab/homeWidgets/detailsScreen/movie_details_screen.dart';

class WatchListTab extends StatefulWidget {
  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  List<Movie> moviesList = [];

  @override
  Widget build(BuildContext context) {
    getMovies();

    return Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(children: [
          Center(
            child: Text(
              'Watch list',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: moviesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          index: index,
                                          moviesList: moviesList,
                                        ),
                                    settings: RouteSettings(
                                        arguments: DetailsScreenArgs(
                                      movie_id: moviesList[index].id!,
                                    ))));
                          },
                          child: Row(
                            children: [
                              Stack(children: [
                                SizedBox(
                                  height: 120,
                                  width: 160,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.fill,
                                        '${ApiConstants.imagePath}${moviesList[index].posterPath}',
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                      return Container(
                                          height: 100,
                                          child: Center(
                                              child: Icon(
                                            Icons.error,
                                            color: MyTheme.whiteColor,
                                          )));
                                    }),
                                  ),
                                ),
                                BookMarkIcon(
                                  movie: moviesList[index],
                                  check: true,
                                )
                              ]),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      moviesList[index].title ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(color: MyTheme.whiteColor),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      moviesList[index].releaseDate ?? '',
                                      // textAlign: TextAlign.end,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: MyTheme.whiteColor,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ]));
  }

  void getMovies() async {
    var list = await FirebaseUtils.getAllMoviesFromFireStore();
    moviesList = list;
    setState(() {});
  }
}
