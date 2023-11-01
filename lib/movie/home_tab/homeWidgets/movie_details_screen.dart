import 'package:flutter/material.dart';
import 'package:movies/api/api_constants.dart';
import 'package:movies/movie/home_tab/recomended/recomended.dart';
import 'package:movies/my_theme.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(
      {required this.moviesList,
      required this.index,
      required this.snapshot,
      required this.similarList,
      required this.movie_id,
      required this.recommendedList});

  AsyncSnapshot snapshot;
  var moviesList;
  var recommendedList;
  int index;
  var movie_id;
  var similarList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: MyTheme.blackGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        title: Text(moviesList[index].title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  '${ApiConstants.imagePath}${moviesList[index].posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  moviesList[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.whiteColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  moviesList[index].releaseDate,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.whiteColor),
                ),
              ),
              Row(
                children: [
                  Image.network(
                    '${ApiConstants.imagePath}${moviesList[index].backdropPath}',
                    height: 180,
                    width: 140,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: MyTheme.whiteColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Action',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.whiteColor),
                        ),
                      ),
                      Text(
                        moviesList[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: MyTheme.whiteColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                              '${moviesList[index].voteAverage?.toStringAsFixed(1)}/10',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: MyTheme.whiteColor)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RecommendedPart(
                  titleName: 'Similar',
                  recommendedList: recommendedList,
                  snapshot: snapshot,
                  similarList: similarList,
                  movie_id: movie_id)
            ])),
      ),
    );
  }
}
