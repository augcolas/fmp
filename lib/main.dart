import 'package:flutter/material.dart';
import 'package:fmp/app/app.bottomsheets.dart';
import 'package:fmp/app/app.dialogs.dart';
import 'package:fmp/app/app.locator.dart';
import 'package:fmp/app/app.router.dart';
import 'package:fmp/services/theme_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: Provider.of<ThemeModel>(context).currentTheme,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
