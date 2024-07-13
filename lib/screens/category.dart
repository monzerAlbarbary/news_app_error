// screens/category_screen.dart
import 'package:copy/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category News'),
      ),
      body: BlocProvider(
        create: (context) => NewsBloc(RepositoryProvider.of<NewsService>(context))..add(FetchNewsByCategory(category)),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              return ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  final news = state.news[index];
                  return ListTile(
                    title: Text(news.title),
                    subtitle: Text(news.description),
                  );
                },
              );
            } else if (state is NewsError) {
              return Center(child: Text('Failed to load news: ${state.message}'));
            } else {
              return Center(child: Text('No news found'));
            }
          },
        ),
      ),
    );
  }
}
