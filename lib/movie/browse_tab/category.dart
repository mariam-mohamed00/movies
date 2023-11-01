import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies/model/BrowseCategories.dart';

import '../../api/api_constants.dart';
import '../../my_theme.dart';

class Category {
  int id;
  String title;

  // String imageUrl;
  Color color;

  Category({
    required this.id,
    required this.title,
    // required this.imageUrl,
    required this.color,
  });

  static List<Category> getCategories() {
    // var categoriesList= results.posterPath;

    return [
      Category(
        id: 28,
        title: 'Action',
        // imageUrl:  '${ApiConstants.imagePath}${moviesList[itemIndex].posterPath}',

        color: Colors.cyan,
      ),
      Category(
          id: 12,
          title: 'Adventure',
          // imageUrl: 'assets/images/Politics.png',
          color: Colors.cyan),
      Category(
          id: 16,
          title: 'Animation',
          // imageUrl: 'assets/images/health.png',
          color: Colors.cyan),
      Category(
          id: 35,
          title: 'Comedy',
          // imageUrl: 'assets/images/bussines.png',
          color: Colors.cyan),
      Category(
          id: 80,
          title: 'Crime',
          // imageUrl: 'assets/images/environment.png',
          color: Colors.cyan),
      Category(
          id: 99,
          title: 'Documentary',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 18,
          title: 'Drama',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 10751,
          title: 'Family',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 14,
          title: 'Fantasy',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 36,
          title: 'History',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 27,
          title: 'Horror',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 10402,
          title: 'Music',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 9648,
          title: 'Mystery',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 10749,
          title: 'Romance',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 878,
          title: 'Science Fiction',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 10770,
          title: 'TV Movie',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 53,
          title: 'Thriller',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 10752,
          title: 'War',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
      Category(
          id: 37,
          title: 'Western',
          // imageUrl: 'assets/images/science.png',
          color: Colors.cyan),
    ];
  }
}
