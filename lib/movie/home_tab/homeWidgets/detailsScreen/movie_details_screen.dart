import 'package:flutter/material.dart';
import 'package:movies/api/api_constants.dart';
import 'package:movies/movie/home_tab/homeWidgets/detailsScreen/similarPart.dart';
import 'package:movies/my_theme.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details movie screen';

  DetailsScreen({
    required this.moviesList,
    required this.index,
  });

  var moviesList;
  int index;

  @override
  Widget build(BuildContext context) {
    DetailsScreenArgs args =
        ModalRoute.of(context)?.settings.arguments as DetailsScreenArgs;

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
              // DetailsMoviePart(index: index, moviesList: moviesList),

              SizedBox(
                height: 20,
              ),

              SimilarMoviesPart(
                movie_id: args.movie_id,
              ),
            ])),
      ),
    );
  }
}

class DetailsScreenArgs {
  int movie_id;

  DetailsScreenArgs({required this.movie_id});
}
