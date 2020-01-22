import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
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
    return CarouselSlider(
      height: 330.0,
      initialPage: 0,
      autoPlay: false,
      enlargeCenterPage: false,
      viewportFraction: 1.1,
      enableInfiniteScroll: true,
      // aspectRatio: 16 / 9,
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
                color: Colors.lightBlueAccent[100],
              ),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
