import 'package:dio/dio.dart';
import 'package:news/models/news_model.dart';

class NewsService {
  final Dio dio;
  NewsService({required this.dio});

  Future<List<ArticlesModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=4e07094086984950af78065d4cff86ac&category=$category');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticlesModel> articlesList = [];

      for (var article in articles) {
        ArticlesModel articlesModel = ArticlesModel.fromjson(article);

        articlesList.add(articlesModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
