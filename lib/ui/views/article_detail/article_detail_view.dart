import 'package:flutter/material.dart';
import 'package:fmp/models/Article.dart';
import 'package:fmp/ui/widgets/common/theme_toggle/theme_toggle.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'article_detail_viewmodel.dart';

class ArticleDetailView extends StackedView<ArticleDetailViewModel> {
  final Article article;
  const ArticleDetailView({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ArticleDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Article Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          ThemeToggle(),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).hintColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Check if medias length is greater than 0 and add the image
            if (article.medias.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Tooltip(
                    message: article.medias[0].copyright,
                    child: Image.network(
                      article.medias[0].url, // Assuming medias[0] is the image URL
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ListTile(
              title: Text(
                article.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(article.publishedAt),
            ),
            const SizedBox(height: 16),
            Text(
              article.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  viewModel.launchURL(article.url);
                },
                child: const Text(
                  "Read Full Article",
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Text(
                "Exit",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ArticleDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ArticleDetailViewModel();
}
