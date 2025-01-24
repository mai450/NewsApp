import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/widgets/categories_horizontal_list.dart';
import 'package:news/widgets/news_list.dart';
import 'package:news/widgets/news_list_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // final List<NewsModel> news = const [
  //   NewsModel(
  //     image:
  //         'https://unsplash.com/photos/young-asian-travel-woman-is-enjoying-with-beautiful-place-in-bangkok-thailand-_Fqoswmdmoo',
  //     title:
  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  //     desc:
  //         'But also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: RichText(
            text: const TextSpan(
                text: 'News',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'Cloud',
                    style: TextStyle(color: Colors.amber, fontSize: 18),
                  ),
                ]),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesHorizontalList(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 22,
                ),
              ),
              NewsListBuilder(
                category: 'general',
              ),
            ],
          ),
        ));
  }
}
