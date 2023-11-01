import 'package:flutter/material.dart';
import 'package:movies/my_theme.dart';
import '../../../api/api_constants.dart';
import '../homeWidgets/movie_details_screen.dart';

class RecommendedPart extends StatefulWidget {
  RecommendedPart(
      {required this.recommendedList,
      required this.snapshot,
      required this.similarList,
      required this.movie_id,
      required this.titleName});

  var recommendedList;
  var similarList;
  AsyncSnapshot snapshot;
  var movie_id;
  String titleName;

  @override
  State<RecommendedPart> createState() => _RecommendedPartState();
}

class _RecommendedPartState extends State<RecommendedPart> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.48,
        decoration: BoxDecoration(
          color: MyTheme.searchColor,
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.only(left: 18.0, top: 10),
            child: Text(
              widget.titleName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.recommendedList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          // color: Colors.white,
                          color: MyTheme.greyColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0.0, 2.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ]),
                      // color: MyTheme.greyColor,
                      child: AspectRatio(
                        aspectRatio: 2 / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(children: [
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
                                        index: index,
                                        moviesList:
                                            widget.snapshot.data?.results ?? [],
                                      ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    '${ApiConstants.imagePath}${widget.recommendedList[index].posterPath}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              click == false
                                  ? InkWell(
                                      onTap: () {
                                        click = !click;
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
                                        click = !click;
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
                                    )
                            ]),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: MyTheme.yellowColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                    '${widget.recommendedList[index].voteAverage}'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(widget.recommendedList[index].title ?? ''),
                            SizedBox(
                              height: 10,
                            ),
                            Text(widget.recommendedList[index].releaseDate ??
                                '2020'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
