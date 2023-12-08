import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fmp/app/app.bottomsheets.dart';
import 'package:fmp/app/app.locator.dart';
import 'package:fmp/ui/common/app_strings.dart';
import 'package:fmp/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
