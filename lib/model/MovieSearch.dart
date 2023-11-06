import 'PopularMoviesResponse.dart';

/// page : 1
/// results : []
/// total_pages : 1
/// total_results : 0

class MovieSearch {
  MovieSearch({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieSearch.fromJson(dynamic json) {
    page = json['page'];

    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<dynamic>? results;
  int? totalPages;
  int? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
