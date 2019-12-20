import 'dart:convert';

import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/home_page/home/car_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  MovieResponse mr;
  List<Results> finalresults = [];
  int page = 1;
  String url =
      "https://api.themoviedb.org/3/movie/popular?api_key=f45b7e038139d8e9bb9f8878d46b6030&page=";

  Future<MovieResponse> getMovie() async {
    return await http.get(url + page.toString()).then((res) {
      MovieResponse mr = MovieResponse.fromJson(json.decode(res.body));
      // page = page + 1;
      return mr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getMovie(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SpinKitDualRing(
                color: Colors.indigo,
                size: 70.0,
              ),
            );
          } else {
            MovieResponse mr = snapshot.data;
            if (mr.results != null) {
              finalresults.addAll(mr.results);
            }

            return GridView.count(
              children: finalresults.map((m) {
                return CarList(m: m);
              }).toList(),
              crossAxisCount: 2,
            );
          }
        },
      ),
    );
  }
}
