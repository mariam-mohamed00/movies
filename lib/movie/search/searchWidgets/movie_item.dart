import 'package:flutter/material.dart';

import '../../../api/api_constants.dart';
import '../../../my_theme.dart';
import '../../home_tab/homeWidgets/detailsScreen/movie_details_screen.dart';

class MovieItem extends StatefulWidget {
  var moviesList;
  var similarList;
  int itemIndex;
  var movie_id;
  var recommendedList;
  final AsyncSnapshot snapshot;

  MovieItem(
      {required this.moviesList,
      required this.itemIndex,
      required this.snapshot,
      required this.similarList,
      required this.movie_id,
      required this.recommendedList});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
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
                      // movie_id: widget.movie_id,
                      index: widget.itemIndex,
                      moviesList: widget.snapshot.data?.results ?? [],
                    ),
                  ));
            },
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      '${ApiConstants.imagePath}${widget.moviesList[widget.itemIndex].posterPath}',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.moviesList[widget.itemIndex].title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: MyTheme.whiteColor),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.moviesList[widget.itemIndex].releaseDate ?? '',
                        // textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.moviesList[widget.itemIndex].originalTitle ?? '',
                        style: Theme.of(context).textTheme.titleSmall,
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
  }
}
