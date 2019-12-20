import 'dart:convert';

import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/home_page/favorite/favorite_home.dart';
import 'package:chocholay_car/view/home_page/favorite/following.dart';
import 'package:chocholay_car/view/home_page/home/car_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with TickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child: TabBar(
            controller: controller,
            tabs: <Widget>[
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
              FavoriteHomePage(),
              FollowingPage(),
            ],
          ),
        )
      ],
    );
  }
}
