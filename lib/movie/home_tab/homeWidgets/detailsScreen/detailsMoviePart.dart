import 'package:flutter/material.dart';

import '../../../../api/api_constants.dart';
import '../../../../my_theme.dart';

class DetailsMoviePart extends StatefulWidget {
  DetailsMoviePart({
    required this.moviesList,
    required this.index,
    // required this.movie_id
    // required this.similarList
  });

  var moviesList;

  // var similarList;
  // String movie_id;
  int index;

  @override
  State<DetailsMoviePart> createState() => _DetailsMoviePartState();
}

class _DetailsMoviePartState extends State<DetailsMoviePart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          '${ApiConstants.imagePath}${widget.moviesList[widget.index].backdropPath}',
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
              widget.moviesList[widget.index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.whiteColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.moviesList[widget.index].releaseDate,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: MyTheme.whiteColor),
              ),
            ),
            // FutureBuilder<SimilarMovies>(
            //     future: ApiManager.getDetailsMovie(args.movieId),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(
            //           child: CircularProgressIndicator(
            //             color: MyTheme.greyColor,
            //           ),
            //         );
            //       } else if (snapshot.hasError) {
            //         return Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const Center(
            //                 child: Text('something went wrong',
            //                     style: TextStyle(color: Colors.white))),
            //             ElevatedButton(
            //                 onPressed: () {
            //                   print(snapshot.error);
            //                   ApiManager.getRecommended();
            //                   setState(() {});
            //                 },
            //                 child: const Text(
            //                   'Try again',
            //                 ))
            //           ],
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
            //                   ('${snapshot.data?.page}') ?? '',
            //                   style: TextStyle(color: MyTheme.whiteColor),
            //                 )),
            //             ElevatedButton(
            //                 onPressed: () {
            //                   print(snapshot.error);
            //                   ApiManager.getRecommended();
            //                   setState(() {});
            //                 },
            //                 child: Text('Try again'))
            //           ],
            //         );
            //       }
            //       var des = snapshot.data?.results ?? [];
            //       return Column(children: [
            //         const SizedBox(height: 32),
            //         Text(des[widget.index].overview ?? '')
            //       ]);
            //     }),
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
                    '${widget.moviesList[widget.index].voteAverage?.toStringAsFixed(1)}/10',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
