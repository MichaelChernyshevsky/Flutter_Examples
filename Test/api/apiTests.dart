// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/api/service/service_api.dart';
import 'package:imaigination_mobile/constants/localization/app_localization.dart';

import '../constants/constantsForTests.dart';
import 'connections/authApi_tests.dart';
import 'connections/serviceApi_tests.dart';
import 'connections/tokenApi_test.dart';
import 'connections/userApi_tests.dart';
import 'func/retio_test.dart';
import 'service/dataService_tests.dart';

void api_Tests(int rundomNumber) {
  const password = '05026sad7';
  final email = 'hel4$rundomNumber@hello.ru';
  // api
  authApi(rundomNumber, password, email);
  tokenApi(rundomNumber, password, email);
  userApi();
  test('login', () async {
    final serviceData = ServiceApi();
    final response = await serviceData.login('hello@hello.ru', '050267');
    expect(response.status, AppLocalizations.current.success);
    setToken(response.accessToken);
  });
  serviceApi();

  //func
  ratioTest();
  // service
  dataServiceTests();
}
