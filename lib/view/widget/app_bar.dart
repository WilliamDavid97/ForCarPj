import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Cho Cho Lay",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Colors.blue.withOpacity(0.5),
            Colors.red.withOpacity(0.5)
          ])),
    );
  }
}
