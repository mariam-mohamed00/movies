import 'package:flutter/material.dart';

import '../../../../api/api_constants.dart';
import '../../../../my_theme.dart';

class DetailsMoviePart extends StatefulWidget {
  DetailsMoviePart({required this.moviesList, required this.index});

  var moviesList;
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
          height: 200,
          width: 140,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     color: Colors.transparent,
            //     border: Border.all(color: MyTheme.whiteColor),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Text(
            //     'Action',
            //     style: Theme.of(context)
            //         .textTheme
            //         .titleSmall!
            //         .copyWith(color: MyTheme.whiteColor),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(widget.moviesList[widget.index].overview,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)),
              ),
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
