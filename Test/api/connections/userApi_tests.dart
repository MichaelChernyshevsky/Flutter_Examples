// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars, file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/constants/exports/hidden_export.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';

import '../../constants/constantsForTests.dart';

Future userApi() async {
  group('UserApi', () {
    const newName = 'newName';
    final userApi = UserApi();

    test('getUser', () async {
      final response = await userApi.getUser(getToken());
      expect(response.email.isNotEmpty, true);
    });

    test('nameAfterPost', () async {
      await userApi.postUser(
        newName,
        await getToken(),
      );
      final response = await userApi.getUser(await getToken());
      expect(response.name, newName);
    });
  });
}
