import 'package:copy/model/article_model.dart';
import 'package:copy/screens/account.dart';
import 'package:copy/screens/category.dart';
import 'package:copy/screens/login.dart';
import 'package:copy/screens/news.dart';
import 'package:copy/screens/save.dart';
import 'package:copy/screens/search.dart';
import 'package:copy/screens/splash.dart';
import 'package:copy/screens/welcom.dart';
import 'package:copy/screens/widget/bottom_navigation.dart';
import 'package:copy/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/news_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => NewsService(),
        child: BlocProvider(
          create: (context) =>
              NewsBloc(RepositoryProvider.of<NewsService>(context)),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            initialRoute: '/search',
            routes: {
              '/': (context) => WelcomeScreen(),
              '/splash': (context) => SplashScreen(),
              '/login': (context) => LoginScreen(),
              '/nav': (context) => CoustomBottomNavigationBar(),
              '/news': (context) => NewsScreen(),
              '/category': (context) => CategoryScreen(category: 'technology'),
              '/search': (context) => SearchScreen(),
              '/saved': (context) =>
                  SavedNewsScreen(savedNews: <ArticleModel>[]),
              '/account': (context) => AccountScreen(),
            },
          ),
        ));
  }
}
