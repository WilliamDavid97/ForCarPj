import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback leftIconCallBack;
  final IconData leftIcon;
  final VoidCallback rightIconCallBack;
  final IconData rightIcon;
  final String title;

  const CustomAppBar({
    Key key,
    this.leftIconCallBack,
    this.leftIcon,
    this.rightIconCallBack,
    this.rightIcon,
    this.title,
  }) : super(key: key);

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
              icon: Icon(leftIcon),
              onPressed: leftIconCallBack,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Kingdom'),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(rightIcon),
              onPressed: rightIconCallBack,
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
