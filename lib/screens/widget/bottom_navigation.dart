import 'package:copy/model/article_model.dart';
import 'package:copy/screens/account.dart';
import 'package:copy/screens/news.dart';
import 'package:copy/screens/save.dart';

import 'package:copy/screens/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CoustomBottomNavigationBar extends StatefulWidget {
  CoustomBottomNavigationBar({super.key});

  @override
  State<CoustomBottomNavigationBar> createState() =>
      _CoustomBottomNavigationBarState();
}

class _CoustomBottomNavigationBarState
    extends State<CoustomBottomNavigationBar> {
  int indexnav = 0;

  final List<Widget> screens = [
    NewsScreen(),
    SearchScreen(),
    SavedNewsScreen(savedNews: <ArticleModel>[]),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        // backgroundColor: Color(0xffFFA500),
        color: Color(0xff001F3F),
        buttonBackgroundColor: Color(0xffFFA500),
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Color(0xffF8F8F8),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Color(0xffF8F8F8),
          ),
          Icon(
            Icons.sd_card_alert_sharp,
            size: 30,
            color: Color(0xffF8F8F8),
          ),
          Icon(
            Icons.face,
            size: 30,
            color: Color(0xffF8F8F8),
          ),
        ],
        onTap: (index) {
          indexnav = index;
          setState(() {});
        },

        index: indexnav,
        letIndexChange: (value) => true,
      ),
      body: screens[indexnav],
    );
  }
}
