import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/providers/searchMoviesProvider.dart';
void main() {
  List<String> keywords=["happy","good","a","break","act","action"];
  test("check the Search poridver data state after init with keywords in keywords list  and  3 page pagination", ()async{
    SearchMovieProvider prov=SearchMovieProvider();
    for(int i=0;i<keywords.length;i++){
      await prov.getSearchMovie(keywords[i]);
      expect("loaded", prov.state);

      for (int i=0;i<3;i++){
        await prov.paginatingMovie();
        expect("loaded", prov.state);
      }
    }

  });
}

