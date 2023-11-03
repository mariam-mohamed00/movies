import 'package:flutter/material.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/model/NewReleases.dart';
import 'package:movies/model/PopularMoviesResponse.dart';
import 'package:movies/model/RecomendedResponse.dart';
import 'package:movies/movie/home_tab/popular/trending_slider.dart';
import 'package:movies/movie/home_tab/recomended/recomended.dart';
import 'package:movies/movie/home_tab/releases/new_releases.dart';
import 'package:movies/my_theme.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<PopularMoviesResponse>(
                  future: ApiManager.getPopular(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.greyColor,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                              child: Text('something went wrong',
                                  style: TextStyle(color: Colors.white))),
                          ElevatedButton(
                              onPressed: () {
                                print(snapshot.error);
                                ApiManager.getPopular();
                                setState(() {});
                              },
                              child: const Text(
                                'Try again',
                              ))
                        ],
                      );
                    }

                    /// response => success / fail
                    if (snapshot.data?.page != 1) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            'error' ?? '',
                            style: TextStyle(color: MyTheme.whiteColor),
                          )),
                          ElevatedButton(
                              onPressed: () {
                                print(snapshot.error);
                                ApiManager.getPopular();
                                setState(() {});
                              },
                              child: Text('Try again'))
                        ],
                      );
                    }
                    var moviesList = snapshot.data?.results ?? [];

                    return Column(children: [
                      const SizedBox(height: 32),
                      PopularSlider(
                        recommendedList: moviesList,
                        movie_id: snapshot.data?.results ?? [],
                        similarList: snapshot.data?.results ?? [],
                        moviesList: snapshot.data?.results ?? [],
                        snapshot: snapshot,
                      ),
                    ]);
                  }),
              FutureBuilder<NewReleases>(
                  future: ApiManager.getNewReleases(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.greyColor,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                              child: Text('something went wrong',
                                  style: TextStyle(color: Colors.white))),
                          ElevatedButton(
                              onPressed: () {
                                print(snapshot.error);
                                ApiManager.getNewReleases();
                                setState(() {});
                              },
                              child: const Text(
                                'Try again',
                              ))
                        ],
                      );
                    }

                    /// response => success / fail
                    if (snapshot.data?.page != 1) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            snapshot.data?.status_message ?? '',
                            style: TextStyle(color: MyTheme.whiteColor),
                          )),
                          ElevatedButton(
                              onPressed: () {
                                print(snapshot.error);
                                ApiManager.getNewReleases();
                                setState(() {});
                              },
                              child: Text('Try again'))
                        ],
                      );
                    }
                    return Column(children: [
                      const SizedBox(height: 32),
                      NewReleasesPart(
                        // movie_id: ,
                        releasesList: snapshot.data?.results ?? [],
                        snapshot: snapshot,
                      ),
                    ]);
                  }),
              FutureBuilder<RecommendedResponse>(
                  future: ApiManager.getRecommended(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.greyColor,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                              child: Text('something went wrong',
                                  style: TextStyle(color: Colors.white))),
                          ElevatedButton(
                              onPressed: () {
                                print(snapshot.error);
                                ApiManager.getRecommended();
                                setState(() {});
                              },
                              child: const Text(
                                'Try again',
                              ))
                        ],
                      );
                    }

                    /// response => success / fail
                    if (snapshot.data?.page != 1) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            ('${snapshot.data?.page}') ?? '',
                            style: TextStyle(color: MyTheme.whiteColor),
                          )),
                          ElevatedButton(
                              onPressed: () {
                                print(snapshot.error);
                                ApiManager.getRecommended();
                                setState(() {});
                              },
                              child: Text('Try again'))
                        ],
                      );
                    }
                    return Column(children: [
                      const SizedBox(height: 32),
                      RecommendedPart(
                        titleName: 'Recommended',
                        movie_id: snapshot.data?.results ?? [],
                        similarList: snapshot.data?.results ?? [],
                        recommendedList: snapshot.data?.results ?? [],
                        snapshot: snapshot,
                      )
                    ]);
                  }),
            ],
          ),
        ));
  }
}
