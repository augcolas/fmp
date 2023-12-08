import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fmp/ui/widgets/common/article_card/article_card.dart';
import 'package:fmp/ui/widgets/common/theme_toggle/theme_toggle.dart';
import 'package:stacked/stacked.dart';
import 'package:fmp/ui/common/app_colors.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: const [
            ThemeToggle(),
          ],
          elevation: 5.0,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).hintColor,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: viewModel.articles.length,
            itemBuilder: (context, index) {
              return ArticleCard(article: viewModel.articles[index], key: key);
            },
          ),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.fetchArticles());
}
