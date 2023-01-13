import 'dart:convert';

import 'MovieModel.dart';
//this model represent the json result come from search movies endpint

SearchMovieModel? SearchMovieModelFromJson(String str) => SearchMovieModel.fromJson(json.decode(str));

String SearchMovieModelToJson(SearchMovieModel? data) => json.encode(data!.toJson());

class SearchMovieModel {
  SearchMovieModel({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<MovieModel?>? movies;
  int? totalPages;
  int? totalResults;

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) => SearchMovieModel(
    page: json["page"],
    movies: json["results"] == null ? [] : List<MovieModel?>.from(json["results"]!.map((x) => MovieModel.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "movies": movies == null ? [] : List<dynamic>.from(movies!.map((x) => x!.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}
