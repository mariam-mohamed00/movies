import 'package:flutter/material.dart';
import 'package:movies/movie/customWidgets/bookmark_icon.dart';

import '../../api/api_constants.dart';
import '../../my_theme.dart';
import '../home_tab/homeWidgets/detailsScreen/movie_details_screen.dart';

class MovieItem extends StatefulWidget {
  var moviesList;
  int itemIndex;

  MovieItem({
    required this.moviesList,
    required this.itemIndex,
  });

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
                            index: widget.itemIndex,
                            moviesList: widget.moviesList,
                          ),
                      settings: RouteSettings(
                          arguments: DetailsScreenArgs(
                        movie_id: widget.moviesList[widget.itemIndex].id,
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
                          '${ApiConstants.imagePath}${widget.moviesList[widget.itemIndex].posterPath}',
                          errorBuilder: (context, error, stackTrace) {
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
                    movie: widget.moviesList[widget.itemIndex],
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
