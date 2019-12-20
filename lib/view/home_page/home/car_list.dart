import 'package:cached_network_image/cached_network_image.dart';
import 'package:chocholay_car/constant/constants.dart';
import 'package:chocholay_car/ob/movie_response.dart';
import 'package:chocholay_car/view/home_page/home/detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CarList extends StatefulWidget {
  final Results m;
  CarList({this.m});
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  int fav = 0;
  @override
  Widget build(BuildContext context) {
    return widget.m.backdropPath != null
        ? Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetailItem(movie: widget.m)));
                print(widget.m.title);
              },
              child: Card(
                color: Colors.lightBlueAccent[100],
                shape: RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            width: 200,
                            height: 120,
                            imageUrl: IMG_LINK + widget.m.backdropPath,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: fav == 0 ? Colors.white : Colors.redAccent,
                            ),
                            onPressed: () {
                              print('Favorite');
                              setState(() {
                                fav = 1;
                                print(fav);
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.m.title,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      'Price :${widget.m.popularity}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetailItem(movie: widget.m)));
                print(widget.m.title);
              },
              child: Card(
                color: Colors.lightBlueAccent[100],
                shape: RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            width: 200,
                            height: 120,
                            imageUrl: IMG_LINK + widget.m.posterPath,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: fav == 0 ? Colors.white : Colors.redAccent,
                            ),
                            onPressed: () {
                              print('Favorite');
                              setState(() {
                                fav = 1;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.m.title,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      'Price :${widget.m.popularity}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
