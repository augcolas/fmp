import 'package:flutter/material.dart';
import 'package:fmp/services/theme_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'theme_toggle_model.dart';

class ThemeToggle extends StackedView<ThemeToggleModel> {
  const ThemeToggle({super.key});

  @override
  Widget builder(
    BuildContext context,
    ThemeToggleModel viewModel,
    Widget? child,
  ) {
    final themeModel = Provider.of<ThemeModel>(context, listen: false);
    return IconButton(
        icon: const Icon(Icons.brightness_4),
      onPressed: () {
        themeModel.toggleTheme();
        //viewModel.toggleTheme();
      }
    );
  }

  @override
  ThemeToggleModel viewModelBuilder(
    BuildContext context,
  ) =>
      ThemeToggleModel();
}
