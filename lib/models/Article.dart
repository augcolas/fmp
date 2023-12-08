import 'package:fmp/models/Media.dart';

class Article {
  final int id;
  final String title;
  final String description;
  final String byline;
  final String url;
  final String publishedAt;
  final List<Media> medias;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.byline,
    required this.url,
    required this.publishedAt,
    required this.medias,
  });
}
