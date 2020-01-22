import 'dart:convert';

import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/home_page/home/car_list.dart';
import 'package:chocholay_car/view/sharedPreferences/shared_pref.dart';
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
    String data = await SharedPref.getData(key: SharedPref.apiTest);
    if (data == null) {
      return await http.get(url + page.toString()).then((res) async {
        SharedPref.setData(key: SharedPref.apiTest, value: res.body);
        MovieResponse mr = MovieResponse.fromJson(json.decode(res.body));
        finalresults = mr.results;
        setState(() {});
        return mr;
      });
    } else {
      MovieResponse movie = MovieResponse.fromJson(json.decode(data));
      finalresults = movie.results;
      setState(() {});
    }
  }

  @override
  void initState() {
    getMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: finalresults == null
          ? Center(
              child: SpinKitDualRing(
                color: Colors.indigo,
                size: 70.0,
              ),
            )
          : GridView.count(
              children: finalresults.map((m) {
                return CarList(m: m);
              }).toList(),
              crossAxisCount: 2,
            ),
    );
  }
}
