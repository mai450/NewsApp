import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/views/web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.articlesModel,
  });

  final ArticlesModel articlesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            image: NetworkImage(articlesModel.image ??
                'https://i.pinimg.com/736x/2a/86/a5/2a86a560f0559704310d98fc32bd3d32.jpg'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          articlesModel.title,
          maxLines: 2,
          style: const TextStyle(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          articlesModel.desc ?? "",
          maxLines: 2,
          style: const TextStyle(
            color: Colors.grey,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          WebView(newUrl: articlesModel.url),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                  ),
                  child: const Text(
                    'view',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(),
        )
      ],
    );
  }
}
