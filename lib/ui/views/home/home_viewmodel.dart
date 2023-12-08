import 'package:fmp/models/Media.dart';
import 'package:stacked/stacked.dart';
import 'package:fmp/app/app.locator.dart';
import 'package:fmp/models/Article.dart';
import 'package:fmp/services/api_service.dart';

class HomeViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  List<Article> articles = [];

  Future fetchArticles() async {
    var data = await _apiService.fetchMostEmailed(7);

    for (var articleJson in data['results']) {
      var article = Article(
        id: articleJson['id'],
        title: articleJson['title'],
        description: articleJson['abstract'],
        byline: articleJson['byline'],
        url: articleJson['url'],
        publishedAt: articleJson['published_date'],
        medias: [],
      );

      for (var mediaJson in articleJson['media']) {
        if (mediaJson['type'] == 'image') {
          var quality = mediaJson['media-metadata'][2] ??
              mediaJson['media-metadata'][1] ??
              mediaJson['media-metadata'][0];
          var media = Media(
            url: quality['url'],
            copyright: mediaJson['copyright'],
          );
          article.medias.add(media);
        }
      }
      articles.add(article);
      notifyListeners();
    }
  }
}
