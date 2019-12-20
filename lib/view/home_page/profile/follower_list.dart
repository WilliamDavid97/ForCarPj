import 'dart:convert';

import 'package:chocholay_car/constant/constants.dart';
import 'package:chocholay_car/ob/movie_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class FollowerListPage extends StatefulWidget {
  @override
  _FollowerListPageState createState() => _FollowerListPageState();
}

class _FollowerListPageState extends State<FollowerListPage> {
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Number of follower"),
          centerTitle: true,
        ),
        body: Container(
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

                return ListView.separated(
                  itemCount: finalresults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  IMG_LINK + finalresults[index].posterPath,
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
                );
              }
            },
          ),
        ));
  }
}
