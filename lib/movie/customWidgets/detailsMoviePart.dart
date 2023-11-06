import 'package:flutter/material.dart';

import '../../api/api_constants.dart';
import '../../my_theme.dart';

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
        Expanded(
          child: Image.network(
              '${ApiConstants.imagePath}${widget.moviesList[widget.index].backdropPath}',
              height: 200,
              width: 140,
              fit: BoxFit.fill, errorBuilder: (context, error, stackTrace) {
            return Center(
                child: Icon(
              Icons.error,
              color: MyTheme.whiteColor,
            ));
          }),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text('${widget.moviesList[widget.index].overview}',
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
                Text('${widget.moviesList[widget.index].voteAverage}/10',
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
