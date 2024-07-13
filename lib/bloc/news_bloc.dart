// // bloc/newsbloc.dart
// import 'package:copy/services/service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'news_event.dart';
// import 'news_state.dart';


// class NewsBloc extends Bloc<NewsEvent, NewsState> {
//   final NewsService newsService;

//   NewsBloc(this.newsService) : super(NewsInitial()) {
//     on<FetchAllNews>(onFetchAllNews);
//     on<FetchNewsByCategory>(onFetchNewsByCategory);
//     on<SearchNews>(onSearchNews);
//   }

//   void onFetchAllNews(FetchAllNews event, Emitter<NewsState> emit) async {
//     emit(NewsLoading());
//     try {
//       final news = await newsService.getAllArticleInCountry();
//       emit(NewsLoaded(news));
//     } catch (e) {
//       emit(NewsError(e.toString()));
//     }
//   }

//   void onFetchNewsByCategory(FetchNewsByCategory event, Emitter<NewsState> emit) async {
//     emit(NewsLoading());
//     try {
//       final news = await newsService.getInCategory(event.category);
//       emit(NewsLoaded(news));
//     } catch (e) {
//       emit(NewsError(e.toString()));
//     }
//   }

//   void onSearchNews(SearchNews event, Emitter<NewsState> emit) async {
//     emit(NewsLoading());
//     try {
//       final news = await newsService.searchInArticle(event.query);
//       emit(NewsLoaded(news));
//     } catch (e) {
//       emit(NewsError(e.toString()));
//     }
//   }
// }
import 'package:copy/services/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;

  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<FetchAllNews>(onFetchAllNews);
    on<FetchNewsByCategory>(onFetchNewsByCategory);
    on<SearchNews>(onSearchNews);
  }

  void onFetchAllNews(FetchAllNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    print("Fetching all news...");
    try {
      final news = await newsService.getAllArticleInCountry();
      print("Fetched all news successfully.");
      emit(NewsLoaded(news));
    } catch (e) {
      print("Error fetching all news: ${e.toString()}");
      emit(NewsError(e.toString()));
    }
  }

  void onFetchNewsByCategory(FetchNewsByCategory event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    print("Fetching news by category: ${event.category}...");
    try {
      final news = await newsService.getInCategory(event.category);
      print("Fetched news by category successfully.");
      emit(NewsLoaded(news));
    } catch (e) {
      print("Error fetching news by category: ${e.toString()}");
      emit(NewsError(e.toString()));
    }
  }

  void onSearchNews(SearchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    print("Searching news with query: ${event.query}...");
    try {
      final news = await newsService.searchInArticle(event.query);
      print("Searched news successfully.");
      emit(NewsLoaded(news));
    } catch (e) {
      print("Error searching news: ${e.toString()}");
      emit(NewsError(e.toString()));
    }
  }
}
