// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';
import 'package:imaigination_mobile/data/service/repo_service.dart';

import '../../constants/constantsForTests.dart';
import '../../mocks/userRepo.mocks.dart';

Future authApi(rundomNumber, password, email) async {
  final serviceData = ServiceApi();
  final UserRepo repo = MockUserRepo();
  final dataService = ServiceData(userRepo: repo);

  group('AuthApi', () {
    test('registratin', () async {
      final response = await serviceData.registration(email, password);

      expect(response.status, AppLocalizations.current.success);
    });

    test('login', () async {
      final response = await serviceData.login(email, password);
      expect(response.status, AppLocalizations.current.success);
      setToken(response.accessToken);
    });

    test('initialize', () async {
      await dataService.initialize();
      expect(dataService.checkUser(), false);
    });
    //not work
    // test('setNewPassword', () async {
    //   final response_set =
    //       await serviceData.setNewPassword(token, email, '05020202');
    //   expect(response_set.status, AppLocalizations.current.success);
    //   final response_resset =
    //       await serviceData.setNewPassword(token, email, password);
    //   expect(response_resset.status, AppLocalizations.current.success);
    // });

    // test('checkCode', () async {});

    // test('sendMail', () async {});
  });
}
