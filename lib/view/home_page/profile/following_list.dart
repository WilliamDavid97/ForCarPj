import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chocholay_car/constant/constants.dart';
import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/sharedPreferences/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class FollowingListPage extends StatefulWidget {
  @override
  _FollowingListPageState createState() => _FollowingListPageState();
}

class _FollowingListPageState extends State<FollowingListPage> {
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Number of follower"),
          centerTitle: true,
        ),
        body: Container(
            child: ListView.separated(
          itemCount: finalresults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(
                          width: 60,
                          height: 60,
                          imageUrl: IMG_LINK + finalresults[index].posterPath,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Center(
                            child: SpinKitDualRing(
                              color: Colors.indigo,
                              size: 40.0,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(finalresults[index].title),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    // padding: EdgeInsets.only(right: 3),
                    child: RaisedButton(
                      child: Text("Follow"),
                      textColor: Colors.white,
                      color: Colors.black,
                      onPressed: () {
                        print("Follow in follower list");
                      },
                    ),
                  )
                ],
              ),
              onTap: () {
                print(finalresults[index]);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        )));
  }
}
