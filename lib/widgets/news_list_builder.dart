import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/services/news_services.dart';
import 'package:news/widgets/news_list.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  // List<ArticlesModel> articles = [];
  // bool isLoading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   getNewsList();
  // }

  // Future<void> getNewsList() async {
  //   articles = await NewsService(dio: Dio()).getNews();
  //   isLoading = false;
  //   setState(() {});
  // }

  var future;

  @override
  void initState() {
    super.initState();

    future = NewsService(dio: Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsList(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(
              child: Text('oooops there was an error'),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
    // return isLoading
    //     ? const SliverFillRemaining(
    //         child: Center(child: CircularProgressIndicator()))
    //     : articles.isNotEmpty
    //         ? NewsList(
    //             articles: articles,
    //           )
    //         : const SliverFillRemaining(
    //             child: Center(
    //               child: Text('oooops there was an error'),
    //             ),
    //           );
  }
}
