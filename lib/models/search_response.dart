// To parse this JSON data, do
//
//     final searchMovies = searchMoviesFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';

class SearchMovies {
  SearchMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory SearchMovies.fromJson(String str) =>
      SearchMovies.fromMap(json.decode(str));

  factory SearchMovies.fromMap(Map<String, dynamic> json) => SearchMovies(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
