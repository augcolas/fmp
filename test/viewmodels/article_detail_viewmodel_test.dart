import 'package:flutter_test/flutter_test.dart';
import 'package:fmp/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ArticleDetailViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
