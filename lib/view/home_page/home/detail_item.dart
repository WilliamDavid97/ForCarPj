import 'package:chocholay_car/constant/constants.dart';
import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/widget/app_bar.dart';
import 'package:chocholay_car/view/widget/carousel_widget.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final Results movie;
  DetailItem({this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: CarouselWidget(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            movie.title,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            movie.popularity,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black54,
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  print('User Profile');
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      NetworkImage(IMG_LINK + movie.posterPath),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        print('User Profile');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Joker',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      )),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          color: Colors.blueGrey,
                                        ),
                                        onPressed: () {
                                          print('Feedback page');
                                        },
                                      ),
                                      Text('5'),
                                      IconButton(
                                        icon: Icon(
                                          Icons.thumb_down,
                                          color: Colors.blueGrey,
                                        ),
                                        onPressed: () {
                                          print('Feedback page');
                                        },
                                      ),
                                      Text('3'),
                                      SizedBox(
                                        width: 70,
                                      ),
                                      Text(
                                        "1 day ago",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black54,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/kilometer.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Kilometer',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${movie.voteCount} Km',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/engine.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Engine Power',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${movie.voteAverage} CC',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black54,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  movie.overview,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Yangon city,Yangon Division',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black54,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Image.asset(
                                  'assets/facebook.png',
                                  width: 35,
                                  height: 35,
                                ),
                                onTap: () {
                                  print('facebook');
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                child: Image.asset(
                                  'assets/messenger.png',
                                  width: 35,
                                  height: 35,
                                ),
                                onTap: () {
                                  print('messenger');
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                child: Image.asset(
                                  'assets/viber.png',
                                  width: 35,
                                  height: 35,
                                ),
                                onTap: () {
                                  print('viber');
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
