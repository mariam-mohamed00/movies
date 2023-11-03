import 'package:flutter/material.dart';
import 'package:movies/api/api_constants.dart';
import 'package:movies/movie/home_tab/homeWidgets/bookmark_icon.dart';
import 'package:movies/my_theme.dart';

import '../homeWidgets/detailsScreen/movie_details_screen.dart';

class NewReleasesPart extends StatefulWidget {
  NewReleasesPart({
    required this.releasesList,
    required this.snapshot,
  });

  var releasesList;
  AsyncSnapshot snapshot;

  @override
  State<NewReleasesPart> createState() => _NewReleasesPartState();
}

class _NewReleasesPartState extends State<NewReleasesPart> {
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
                itemCount: widget.releasesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      height: 220,
                      child: AspectRatio(
                        aspectRatio: 4 / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    index: index,
                                    moviesList:
                                        widget.snapshot.data?.results ?? [],
                                  ),
                                  settings: RouteSettings(
                                    arguments: DetailsScreenArgs(
                                      movie_id: widget.releasesList[index].id,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Stack(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                      "${ApiConstants.imagePath}${widget.releasesList[index].posterPath}")),
                              BookMarkIcon(),
                            ]),
                          ),
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
