import 'dart:convert';

import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/home_page/favorite/favorite_home.dart';
import 'package:chocholay_car/view/home_page/favorite/following.dart';
import 'package:chocholay_car/view/home_page/profile/follower_list.dart';
import 'package:chocholay_car/view/home_page/profile/following_list.dart';
import 'package:chocholay_car/view/home_page/profile/listing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
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

  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'http://getwallpapers.com/wallpaper/full/e/e/b/1281416-beautiful-jared-leto-joker-wallpaper-1920x1080-hd.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Joker",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0987654321',
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Yangon City, Yangon Division"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/like.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('7'),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/dislike.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('3'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.calendar_today),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Join Date : 10-10-2019',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black54,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                child: Column(
                  children: <Widget>[
                    Text("1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "Kingdom",
                        )),
                    Text('Listing'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                child: InkWell(
                  onTap: () {
                    print("Follower List");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FollowerListPage()));
                  },
                  child: Column(
                    children: <Widget>[
                      Text("5",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: "Kingdom",
                          )),
                      Text('Followers'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                child: InkWell(
                  onTap: () {
                    print("Following List");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FollowingListPage()));
                  },
                  child: Column(
                    children: <Widget>[
                      Text("3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: "Kingdom",
                          )),
                      Text('Followings'),
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black54,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: TabBar(
              controller: controller,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Listing",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Favorite",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Following",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                ListingPage(),
                FavoriteHomePage(),
                FollowingPage(),
              ],
            ),
          )
          // Container(
          //   child: FutureBuilder(
          //     future: getMovie(),
          //     builder: (BuildContext context, AsyncSnapshot snapshot) {
          //       if (!snapshot.hasData) {
          //         return Center(
          //           child: SpinKitCircle(
          //             color: Colors.indigo,
          //             size: 70.0,
          //           ),
          //         );
          //       } else {
          //         MovieResponse mr = snapshot.data;
          //         if (mr.results != null) {
          //           finalresults.addAll(mr.results);
          //         }

          //         return GridView.count(
          //           children: finalresults.map((m) {
          //             return CarList(m: m);
          //           }).toList(),
          //           crossAxisCount: 1,
          //         );
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
