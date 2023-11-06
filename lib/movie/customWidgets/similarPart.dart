import 'package:flutter/material.dart';
import 'package:movies/movie/home_tab/recomended/recomended.dart';
import 'package:movies/my_theme.dart';

import '../../api/api_manager.dart';
import '../../model/NewReleases.dart';

class SimilarMoviesPart extends StatefulWidget {
  int movie_id;
  var list;

  SimilarMoviesPart({required this.movie_id, required this.list});

  @override
  State<SimilarMoviesPart> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMoviesPart> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesResponse>(
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
                      ApiManager.getSimilar(widget.movie_id);
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
                      ApiManager.getSimilar(widget.list);
                      setState(() {});
                    },
                    child: Text('Try again'))
              ],
            );
          }
          var similarMoviesList = snapshot.data?.results ?? [];

          return RecommendedPart(
              recommendedList: similarMoviesList,
              snapshot: snapshot,
              titleName: 'Similar');
        });
  }
}
