// bloc/news_event.dart
abstract class NewsEvent {}

class FetchAllNews extends NewsEvent {}

class FetchNewsByCategory extends NewsEvent {
  final String category;
  FetchNewsByCategory(this.category);
}

class SearchNews extends NewsEvent {
  final String query;
  SearchNews(this.query);
}
