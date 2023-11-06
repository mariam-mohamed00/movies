import 'package:flutter/material.dart';

import '../../firebase/firebase_utils.dart';
import '../../model/NewReleases.dart';
import '../../my_theme.dart';

class BookMarkIcon extends StatefulWidget {
  var movie;
  bool check;

  BookMarkIcon({
    required this.movie,
    this.check = false,
  });

  @override
  State<BookMarkIcon> createState() => _BookMarkIconState();
}

class _BookMarkIconState extends State<BookMarkIcon> {
  @override
  Widget build(BuildContext context) {
    checkMovie();
    return Container(
      child: widget.check == false
          ? InkWell(
              onTap: () {
                widget.check = !widget.check;
                addMovie();
                setState(() {});
              },
              child: Stack(children: [
                Image.asset(
                  'assets/images/Icon awesome-bookmark-grey.png',
                ),
                Icon(
                  Icons.add,
                  color: MyTheme.whiteColor,
                )
              ]),
            )
          : InkWell(
              onTap: () {
                widget.check = !widget.check;
                FirebaseUtils.deleteMovieFromFireStore(
                    widget.movie, widget.movie.id);
                setState(() {});
              },
              child: Stack(children: [
                Image.asset(
                  'assets/images/Icon awesome-bookmark.png',
                ),
                Icon(
                  Icons.check,
                  color: MyTheme.whiteColor,
                )
              ]),
            ),
    );
  }

  void addMovie() {
    Movie movie = Movie(
        title: widget.movie.title ?? '',
        posterPath: widget.movie.posterPath ?? '',
        releaseDate: widget.movie.releaseDate ?? '',
        overview: widget.movie.overview ?? '',
        backdropPath: widget.movie.backdropPath ?? '',
        voteAverage: widget.movie.voteAverage,
        id: widget.movie.id);
    FirebaseUtils.addMovieToFireStore(movie)
        .timeout(Duration(milliseconds: 500), onTimeout: () {
      print('movie added successfully');
    });
  }

  void checkMovie() async {
    var list = await FirebaseUtils.isInWatchList(widget.movie.id);
    widget.check = list;
    setState(() {});
  }
}
