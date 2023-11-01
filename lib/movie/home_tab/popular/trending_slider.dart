import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../api/api_constants.dart';
import '../../../my_theme.dart';
import '../homeWidgets/movie_details_screen.dart';

class PopularSlider extends StatefulWidget {
  PopularSlider(
      {required this.moviesList,
      required this.snapshot,
      required this.similarList,
      required this.movie_id,
      required this.recommendedList});

  final AsyncSnapshot snapshot;
  var moviesList;
  var recommendedList;
  var similarList;
  var movie_id;

  @override
  State<PopularSlider> createState() => _PopularSliderState();
}

class _PopularSliderState extends State<PopularSlider> {
  bool autoPlay = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: widget.moviesList.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: !autoPlay,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(microseconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            child: Stack(alignment: Alignment.center, children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                            '${ApiConstants.imagePath}${widget.moviesList[itemIndex].posterPath}',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 130, top: 10),
                      child: Text(
                        widget.moviesList[itemIndex].title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 130, top: 10),
                      child: Text(
                        '${widget.moviesList[itemIndex].releaseDate}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recommendedList: widget.recommendedList,
                          movie_id: widget.movie_id,
                          similarList: widget.similarList,
                          snapshot: widget.snapshot,
                          index: itemIndex,
                          moviesList: widget.snapshot.data?.results ?? [],
                        ),
                      ),
                    );
                  },
                  child: Image.network(
                    '${ApiConstants.imagePath}${widget.moviesList[itemIndex].backdropPath}',
                    height: 180,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ]),
              IconButton(
                  onPressed: () {
                    autoPlay = !autoPlay;
                    setState(() {});
                    print('autoplay');
                  },
                  icon: Icon(
                    Icons.play_circle_fill_rounded,
                    color: MyTheme.whiteColor,
                    size: 70,
                  ))
            ]),
          );
        },
      ),
    );
  }
}
