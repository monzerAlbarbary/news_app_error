// screens/saved_news_screen.dart
import 'package:copy/model/article_model.dart';
import 'package:flutter/material.dart';


class SavedNewsScreen extends StatelessWidget {
  final List<ArticleModel> savedNews;

  SavedNewsScreen({required this.savedNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved News'),
      ),
      body: savedNews.isEmpty
          ? Center(child: Text('No saved news'))
          : ListView.builder(
              itemCount: savedNews.length,
              itemBuilder: (context, index) {
                final news = savedNews[index];
                return ListTile(
                  title: Text(news.title),
                  subtitle: Text(news.description),
                );
              },
            ),
    );
  }
}
