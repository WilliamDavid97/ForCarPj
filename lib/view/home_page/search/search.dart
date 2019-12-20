import 'package:chocholay_car/view/widget/app_bar.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            title: "Cho Cho Lay Car",
            rightIcon: Icons.home,
            rightIconCallBack: () {
              Navigator.pop(context);
            },
          ),
          Center(
            child: Text("Search Page"),
          )
        ],
      ),
    );
  }
}
