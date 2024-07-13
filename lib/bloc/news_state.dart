// bloc/news_state.dart
import 'package:copy/model/article_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<ArticleModel> news;
  NewsLoaded(this.news);
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}
