// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:imaigination_mobile/manager/provider/app_provider.dart';

Future appProvider() async {
  GetIt.I.registerSingleton<AppProvider>(AppProvider());

  group('AppProvider is not empty', () {
    test('prices', () {
      expect(GetIt.I.get<AppProvider>().prices.isNotEmpty, true);
    });

    test('subs', () {
      expect(GetIt.I.get<AppProvider>().subs.isNotEmpty, true);
    });

    test('feedback', () {
      expect(GetIt.I.get<AppProvider>().feedback.isNotEmpty, true);
    });

    test('privacyPolicy', () {
      expect(GetIt.I.get<AppProvider>().privacyPolicy.isNotEmpty, true);
    });

    test('termsAndCond', () {
      expect(GetIt.I.get<AppProvider>().termsAndCond.isNotEmpty, true);
    });

    test('styleModels', () {
      expect(GetIt.I.get<AppProvider>().styleModels.isNotEmpty, true);
    });
  });
}
