
// import 'package:copy/model/article_model.dart';
// import 'package:dio/dio.dart';

// class NewsService {
//   final String baseurl = "https://newsapi.org/v2/top-headlines?apiKey=02ccdc04c82a4ab68de9bb2100e1d7bd&country=us";
//   Dio dio = Dio();

//   Future<List<ArticleModel>> getAllArticleInCountry() async {
//     final response = await dio.get(baseurl);
//     if (response.statusCode == 200) {
//       List articles = response.data['articles'];
//       return articles.map((e) => ArticleModel.fromMap(e)).toList();
//     } else {
//       throw Exception("Failed to load Article");
//     }
//   }

//   Future<List<ArticleModel>> getInCategory(String category) async {
//     final response = await dio.get("$baseurl&category=$category");
//     if (response.statusCode == 200) {
//       List articles = response.data['articles'];
//       return articles.map((e) => ArticleModel.fromMap(e)).toList();
//     } else {
//       throw Exception("Failed to load Article");
//     }
//   }

//   Future<List<ArticleModel>> searchInArticle(String query) async {
//     final response = await dio.get("$baseurl&q=$query");
//     if (response.statusCode == 200) {
//       List articles = response.data['articles'];
//       return articles.map((e) => ArticleModel.fromMap(e)).toList();
//     } else {
//       throw Exception("Failed to load Article");
//     }
//   }
// }
import 'package:copy/model/article_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  final String baseurl = "https://newsapi.org/v2/top-headlines?apiKey=02ccdc04c82a4ab68de9bb2100e1d7bd&country=us";
  Dio dio = Dio();

  Future<List<ArticleModel>> getAllArticleInCountry() async {
    try {
      final response = await dio.get(baseurl);
      if (response.statusCode == 200) {
        List articles = response.data['articles'];
        return articles.map((e) => ArticleModel.fromMap(e)).toList();
      } else {
        throw Exception("Failed to load articles. Status code: ${response.statusCode}");
      }
    } on DioError catch (dioError) {
      // Handle Dio errors
      print("DioError: ${dioError.message}");
      if (dioError.response != null) {
        print("DioError response data: ${dioError.response!.data}");
        print("DioError response headers: ${dioError.response!.headers}");
      }
      throw Exception("Failed to load articles due to DioError: ${dioError.message}");
    } catch (e) {
      // Handle other types of errors
      print("Error: ${e.toString()}");
      throw Exception("Failed to load articles: ${e.toString()}");
    }
  }

  Future<List<ArticleModel>> getInCategory(String category) async {
    try {
      final response = await dio.get("$baseurl&category=$category");
      if (response.statusCode == 200) {
        List articles = response.data['articles'];
        return articles.map((e) => ArticleModel.fromMap(e)).toList();
      } else {
        throw Exception("Failed to load articles. Status code: ${response.statusCode}");
      }
    } on DioError catch (dioError) {
      // Handle Dio errors
      print("DioError: ${dioError.message}");
      if (dioError.response != null) {
        print("DioError response data: ${dioError.response!.data}");
        print("DioError response headers: ${dioError.response!.headers}");
      }
      throw Exception("Failed to load articles due to DioError: ${dioError.message}");
    } catch (e) {
      // Handle other types of errors
      print("Error: ${e.toString()}");
      throw Exception("Failed to load articles: ${e.toString()}");
    }
  }

  Future<List<ArticleModel>> searchInArticle(String query) async {
    try {
      final response = await dio.get("$baseurl&q=$query");
      if (response.statusCode == 200) {
        List articles = response.data['articles'];
        return articles.map((e) => ArticleModel.fromMap(e)).toList();
      } else {
        throw Exception("Failed to load articles. Status code: ${response.statusCode}");
      }
    } on DioException catch (dioError) {
      // Handle Dio errors
      print("DioError: ${dioError.message}");
      if (dioError.response != null) {
        print("DioError response data: ${dioError.response!.data}");
        print("DioError response headers: ${dioError.response!.headers}");
      }
      throw Exception("Failed to load articles due to DioError: ${dioError.message}");
    } catch (e) {
      // Handle other types of errors
      print("Error: ${e.toString()}");
      throw Exception("Failed to load articles: ${e.toString()}");
    }
  }
}
