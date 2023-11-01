import 'package:flutter/material.dart';
import 'package:movies/api/api_constants.dart';
import 'package:movies/my_theme.dart';
import '../homeWidgets/movie_details_screen.dart';

class NewReleasesPart extends StatefulWidget {
  NewReleasesPart(
      {required this.newReleasesList,
      required this.snapshot,
      required this.similarList,
      required this.movie_id,
      required this.recommendedList});

  var newReleasesList;
  var similarList;
  AsyncSnapshot snapshot;
  var movie_id;
  var recommendedList;

  @override
  State<NewReleasesPart> createState() => _NewReleasesPartState();
}

class _NewReleasesPartState extends State<NewReleasesPart> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: MyTheme.searchColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18.0, top: 10),
              child: Text(
                'New Releases ',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.newReleasesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      height: 220,
                      child: AspectRatio(
                        aspectRatio: 4 / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Stack(children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      movie_id: widget.movie_id,
                                      similarList: widget.similarList,
                                      snapshot: widget.snapshot,
                                      index: index,
                                      moviesList:
                                          widget.snapshot.data?.results ?? [],
                                      recommendedList: widget.recommendedList,
                                    ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                      "${ApiConstants.imagePath}${widget.newReleasesList[index].posterPath}")),
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
                        ),
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ],
        ));
  }
}
