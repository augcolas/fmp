import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fmp/ui/widgets/common/article_card/article_card.dart';
import 'package:fmp/ui/widgets/common/theme_toggle/theme_toggle.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'News',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: const [
              ThemeToggle(),
            ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).hintColor,
              labelStyle: Theme.of(context).textTheme.labelSmall,
              tabs: const[
                Tab(text: 'Emailed'),
                Tab(text: 'Facebook'),
                Tab(text: 'Viewed'),
              ],
            ),
            elevation: 5.0,
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).hintColor,
          ),
          body: TabBarView(
            children: [
              Center(
                child: ListView.builder(
                  itemCount: viewModel.emailedArticles.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(article: viewModel.emailedArticles[index]);
                  },
                ),
              ),
              Center(
                child: ListView.builder(
                  itemCount: viewModel.facebookArticles.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(article: viewModel.facebookArticles[index]);
                  },
                ),
              ),
              Center(
                child: ListView.builder(
                  itemCount: viewModel.facebookArticles.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(article: viewModel.viewedArticles[index]);
                  },
                ),
              ),
            ]
          )
      )
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
  .addPostFrameCallback((timeStamp) => {
    viewModel.fetchArticles('emailed'),
    viewModel.fetchArticles('facebook'),
    viewModel.fetchArticles('viewed'),
  });
}
