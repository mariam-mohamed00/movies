import 'package:flutter/material.dart';
import 'package:movies/model/SimilarMovies.dart';
import 'package:movies/movie/home_tab/homeWidgets/bookmark_icon.dart';
import 'package:movies/my_theme.dart';

import '../../../../api/api_constants.dart';
import '../../../../api/api_manager.dart';
import 'movie_details_screen.dart';

class SimilarMoviesPart extends StatefulWidget {
  int movie_id;

  SimilarMoviesPart({required this.movie_id});

  @override
  State<SimilarMoviesPart> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMoviesPart> {
  // bool click = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SimilarMovies>(
        future: ApiManager.getSimilar(widget.movie_id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.greyColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text('something went wrong',
                        style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () {
                      print(snapshot.error);
                      ApiManager.getPopular();
                      setState(() {});
                    },
                    child: const Text(
                      'Try again',
                    ))
              ],
            );
          }

          /// response => success / fail
          if (snapshot.data?.page != 1) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  '${snapshot.error}' ?? '',
                  style: TextStyle(color: MyTheme.whiteColor),
                )),
                ElevatedButton(
                    onPressed: () {
                      print(snapshot.error);
                      ApiManager.getPopular();
                      setState(() {});
                    },
                    child: Text('Try again'))
              ],
            );
          }
          var similarMoviesList = snapshot.data?.results ?? [];

          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.48,
            decoration: BoxDecoration(
              color: MyTheme.searchColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 10),
                  child: Text(
                    'Similar',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: similarMoviesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150,
                        width: 180,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
// color: Colors.white,
                                color: MyTheme.greyColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(0.0, 2.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ]),
// color: MyTheme.greyColor,
                            child: AspectRatio(
                              aspectRatio: 2 / 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Stack(children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                              // movie_id: widget.movie_id,
                                              index: index,
                                              moviesList:
                                                  snapshot.data?.results ?? [],
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          '${ApiConstants.imagePath}${similarMoviesList[index].posterPath}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    BookMarkIcon()
                                  ]),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: MyTheme.yellowColor,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                          '${similarMoviesList[index].voteAverage}'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(similarMoviesList[index].title ?? ''),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(similarMoviesList[index].releaseDate ??
                                      '2020'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}