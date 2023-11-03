import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/Categories.dart';
import 'package:movies/model/MovieSearch.dart';
import 'package:movies/model/NewReleases.dart';
import 'package:movies/model/PopularMoviesResponse.dart';
import 'package:movies/model/RecomendedResponse.dart';
import 'package:movies/model/SimilarMovies.dart';

import '../model/BrowseCategories.dart';
import 'api_constants.dart';

class ApiManager {
  static Future<PopularMoviesResponse> getPopular() async {
    /// https://api.themoviedb.org/3/movie/popular
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi,
        {"api_key": "b2a61005339883119cb9765bd932c27e"});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularMoviesResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<MovieSearch> searchMovie(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.searchApi,
        {"api_key": "b2a61005339883119cb9765bd932c27e", "query": query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieSearch.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewReleases> getNewReleases() async {
    /// https://api.themoviedb.org/3/movie/upcoming
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesApi,
        {"api_key": "b2a61005339883119cb9765bd932c27e"});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewReleases.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<RecommendedResponse> getRecommended() async {
    /// https://api.themoviedb.org/3/movie/upcoming
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.recommendedApi,
        {"api_key": "b2a61005339883119cb9765bd932c27e"});

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RecommendedResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<SimilarMovies> getSimilar(int movieId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl,
        '${ApiConstants.similarApi}$movieId${ApiConstants.similarApi2}',
        {"api_key": "b2a61005339883119cb9765bd932c27e"});
    try {
      // print(movieId);
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      // print(json);
      return SimilarMovies.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  // static Future<SimilarMovies> getDetailsMovie(int movieId) async {
  //   Uri url = Uri.https(ApiConstants.baseUrl, '${ApiConstants.deatailsApi}$movieId',
  //       {"api_key": "b2a61005339883119cb9765bd932c27e"});
  //   try {
  //     // print(movieId);
  //     var response = await http.get(url);
  //     var bodyString = response.body;
  //     var json = jsonDecode(bodyString);
  //     print(json);
  //     return SimilarMovies.fromJson(json);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  static Future<Categories> getNameOfCategory() async {
    ///https://api.themoviedb.org/3/genre/movie/list
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.category,
        {"api_key": "b2a61005339883119cb9765bd932c27e"});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return Categories.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<BrowseCategories> getBrowseCategories(int? categoryId) async {
    /// https://api.themoviedb.org/3/discover/movie

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.browseCategories,
        {"api_key": "b2a61005339883119cb9765bd932c27e", "id": categoryId});

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return BrowseCategories.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
