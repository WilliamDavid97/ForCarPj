// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chocholay_car/constant/constants.dart';
// import 'package:chocholay_car/ob/movie_response.dart';
// import 'package:chocholay_car/view/home_page/home/car_list.dart';
// import 'package:chocholay_car/view/home_page/home/detail_item.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:http/http.dart' as http;
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   MovieResponse mr;
//   List<Results> finalresults = [];
//   int page = 1;
//   int fav = 0;
//   RefreshController _refreshController =
//       RefreshController(initialRefresh: false);

//   String url =
//       "https://api.themoviedb.org/3/movie/popular?api_key=f45b7e038139d8e9bb9f8878d46b6030&page=";

//   Future<MovieResponse> getMovie() async {
//     return await http.get(url + page.toString()).then((res) {
//       MovieResponse mr = MovieResponse.fromJson(json.decode(res.body));
//       // page = page + 1;
//       return mr;
//     });
//   }

//   void _onRefresh() async {
//     // monitor network fetch
//     await Future.delayed(Duration(milliseconds: 1000));
//     // if failed,use refreshFailed()
//     _refreshController.refreshCompleted();
//   }

//   void _onLoading() async {
//     // monitor network fetch
//     await Future.delayed(Duration(milliseconds: 1000));
//     // if failed,use loadFailed(),if no data return,use LoadNodata()
//     // items.add((items.length + 1).toString());
//     page = (page + 1);
//     if (mounted) setState(() {});
//     _refreshController.loadComplete();
//     print(page);
//   }

//   CarouselSlider carouselSlider;
//   int _current = 0;
//   List<String> image = [
//     'assets/slide1.jpg',
//     'assets/slide2.jpg',
//     'assets/slide3.jpg',
//     'assets/slide4.jpg',
//     'assets/slide5.jpg',
//   ];
//   List<T> map<T>(List list, Function handler) {
//     List<T> result = [];
//     for (var i = 0; i < list.length; i++) {
//       result.add(handler(i, list[i]));
//     }
//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: <Widget>[
//         SliverAppBar(
//           expandedHeight: 200,
//           flexibleSpace: FlexibleSpaceBar(
//             background: CarouselSlider(
//               height: 200.0,
//               initialPage: 0,
//               autoPlay: true,
//               enlargeCenterPage: true,
//               autoPlayAnimationDuration: Duration(seconds: 2),
//               onPageChanged: (index) {
//                 setState(() {
//                   _current = index;
//                 });
//               },
//               items: image.map((imgUrl) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 10.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Colors.lightBlueAccent,
//                       ),
//                       child: Image.asset(imgUrl, fit: BoxFit.fill),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Text(
//                     "Types of Cars",
//                     style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.indigo,
//                         fontFamily: 'Kingdom'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: FutureBuilder(
//                     future: getMovie(),
//                     builder: (BuildContext context, AsyncSnapshot snapshot) {
//                       if (!snapshot.hasData) {
//                         return Center(
//                           child: SpinKitWave(
//                             color: Colors.indigo,
//                             size: 70.0,
//                           ),
//                         );
//                       } else {
//                         MovieResponse mr = snapshot.data;
//                         if (mr.results != null) {
//                           finalresults.addAll(mr.results);
//                         }

//                         return SmartRefresher(
//                           enablePullDown: true,
//                           enablePullUp: true,
//                           header: WaterDropHeader(),
//                           footer: CustomFooter(
//                             builder: (BuildContext context, LoadStatus mode) {
//                               Widget body;
//                               if (mode == LoadStatus.idle) {
//                                 body = Text("pull up load");
//                               } else if (mode == LoadStatus.loading) {
//                                 body = CupertinoActivityIndicator();
//                               } else if (mode == LoadStatus.failed) {
//                                 body = Text("Load Failed!Click retry!");
//                               } else if (mode == LoadStatus.canLoading) {
//                                 body = Text("release to load more");
//                               } else {
//                                 body = Text("No more Data");
//                               }
//                               return Container(
//                                 height: 55.0,
//                                 child: Center(child: body),
//                               );
//                             },
//                           ),
//                           controller: _refreshController,
//                           onRefresh: _onRefresh,
//                           onLoading: _onLoading,
//                           child: GridView.count(
//                             children: finalresults.map((m) {
//                               return CarList(m: m);
//                             }).toList(),
//                             crossAxisCount: 2,
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 )
//               ],
//             )
//           ]),
//         )
//       ],
//     );
//   }
// }

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chocholay_car/constant/constants.dart';
import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/home_page/home/car_list.dart';
import 'package:chocholay_car/view/home_page/home/detail_item.dart';
import 'package:chocholay_car/view/sharedPreferences/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MovieResponse mr;
  List<Results> finalresults = [];
  int page = 1;
  int fav = 0;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 1).toString());
    page = (page + 1);
    if (mounted) setState(() {});
    _refreshController.loadComplete();
    print(page);
  }

  CarouselSlider carouselSlider;
  int _current = 0;
  List<String> image = [
    'assets/slide1.jpg',
    'assets/slide2.jpg',
    'assets/slide3.jpg',
    'assets/slide4.jpg',
    'assets/slide5.jpg',
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: CarouselSlider(
            height: 200.0,
            initialPage: 0,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            items: image.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Image.asset(imgUrl, fit: BoxFit.fill),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Types of Cars",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontFamily: 'Kingdom'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: finalresults == null
                ? Center(
                    child: SpinKitWave(
                      color: Colors.indigo,
                      size: 70.0,
                    ),
                  )
                : SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    header: WaterDropHeader(),
                    footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text("pull up load");
                        } else if (mode == LoadStatus.loading) {
                          body = CupertinoActivityIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = Text("Load Failed!Click retry!");
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text("release to load more");
                        } else {
                          body = Text("No more Data");
                        }
                        return Container(
                          height: 55.0,
                          child: Center(child: body),
                        );
                      },
                    ),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: GridView.count(
                      children: finalresults.map((m) {
                        return CarList(m: m);
                      }).toList(),
                      crossAxisCount: 2,
                    ),
                  ))
      ],
    );
  }
}
