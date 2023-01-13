import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/providers/discoverMoviesProvider.dart';
void main() {
  group("groupTest", () {

    test("check the discover poridver data state after init and  20 page pagination", ()async{
      DiscoverMoviesProvider prov=DiscoverMoviesProvider();
      await prov.initMovie();
      expect("loaded", prov.state);

      for (int i=0;i<100;i++){
        await prov.paginatingMovie();
        expect("loaded", prov.state);
      }
    });
    test("check after 3 pagination movies list must have 80 moives like the result in postman", ()async{
      DiscoverMoviesProvider prov=DiscoverMoviesProvider();
      await prov.initMovie();
      expect("loaded", prov.state);

      for (int i=0;i<3;i++){
        await prov.paginatingMovie();
      }
      expect(80, prov.discoverMoviesModel!.movies!.length);
    });

  });
}
