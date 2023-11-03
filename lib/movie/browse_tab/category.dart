import 'package:flutter/material.dart';

class Category {
  String title;
  Color color;
  int id;

  Category({required this.title, required this.color, required this.id});

  static List<Category> getCategories() {
    return [
      Category(
        id: 28,
        title: 'Action',
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
