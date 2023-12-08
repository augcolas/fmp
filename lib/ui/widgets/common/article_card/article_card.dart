import 'package:flutter/material.dart';
import 'package:fmp/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:fmp/models/Article.dart';
import 'article_card_model.dart';

class ArticleCard extends StackedView<ArticleCardModel> {
  final Article article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget builder(
    BuildContext context,
    ArticleCardModel viewModel,
    Widget? child,
  ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Check if medias length is greater than 0 and add the image
              if (article.medias.isNotEmpty)
                Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                    child: Tooltip(
                      message: article.medias[0].copyright,
                      child: Image.network(
                        article.medias[0]
                            .url, // Assuming medias[0] is the image URL
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: ListTile(
                  title: Text(
                    article.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(article.publishedAt),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              article.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  viewModel.showCompleteArticle(article);
                },
                child: Text(
                  'Show More',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  ArticleCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      ArticleCardModel();
}
