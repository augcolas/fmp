import 'package:fmp/models/Article.dart';
import 'package:stacked/stacked.dart';
import 'package:fmp/app/app.locator.dart';
import 'package:fmp/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class ArticleCardModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void showCompleteArticle(Article article) {
    print(article.id);
    //navigate to article details page
    _navigationService.navigateToArticleDetailView(article: article);
  }
}
