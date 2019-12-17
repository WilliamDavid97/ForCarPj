import 'package:chocholay_car/view/home_page/home_view.dart';
import 'package:chocholay_car/view/home_page/profile.dart';
import 'package:chocholay_car/view/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import 'message.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(),
          Expanded(
            child: currentPage == 1
                ? MessagePage()
                : currentPage == 2 ? ProfilePage() : HomeView(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: FancyBottomNavigation(
          barBackgroundColor: Colors.grey[100],
          tabs: [
            TabData(
              iconData: Icons.home,
              title: 'Home',
            ),
            TabData(
              iconData: Icons.message,
              title: 'Message',
            ),
            TabData(
              iconData: Icons.person,
              title: 'Profile',
            )
          ],
          onTabChangedListener: (position) {
            setState(() {
              print(position);
              currentPage = position;
            });
          },
        ),
      ),
    );
  }
}
