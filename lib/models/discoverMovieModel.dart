import 'dart:convert';

import 'MovieModel.dart';
//this model represent the json result come from discover movie endpoint
DiscoverMovieModel? DiscoverMovieModelFromJson(String str) => DiscoverMovieModel.fromJson(json.decode(str));

String DiscoverMovieModelToJson(DiscoverMovieModel? data) => json.encode(data!.toJson());

class DiscoverMovieModel {
  DiscoverMovieModel({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<MovieModel?>? movies;
  int? totalPages;
  int? totalResults;

  factory DiscoverMovieModel.fromJson(Map<String, dynamic> json) => DiscoverMovieModel(
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
