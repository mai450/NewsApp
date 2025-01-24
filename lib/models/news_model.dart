class ArticlesModel {
  final String? image;
  final String title;
  final String? desc;
  final String url;

  const ArticlesModel(
      {required this.image,
      required this.title,
      required this.desc,
      required this.url});

  factory ArticlesModel.fromjson(json) {
    return ArticlesModel(
        image: json['urlToImage'],
        title: json['title'],
        desc: json['description'],
        url: json['url']);
  }
}
