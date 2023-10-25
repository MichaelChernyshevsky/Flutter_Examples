// ignore_for_file: avoid_dynamic_calls, non_constant_identifier_names,, file_names
// ignore_for_file:prefer_typing_uninitialized_variables, lines_longer_than_80_chars
import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';

Future dataServiceTests() async {
  final serviceData = ServiceApi();

  const password = '050267';
  const email = 'hello@hello.ru';
  const id = 49;

  group('Data Service', () {
    test('search', () async {
      final widget = await serviceData.search(1, 'car');
      expect(widget.widgets.isNotEmpty, true);
    });
    test('random', () async {
      final response = await serviceData.random();
      expect(response.text.isNotEmpty, true);
    });
    // test('history', () async {
    //   final widget = await serviceData.history(id);
    //   expect(widget.widgets.isNotEmpty, true);
    // });
    test('getToken', () async {
      final response = await serviceData.getToken(email, password);
      expect(response.status, AppLocalizations.current.success);
    });
  });

  // group('Other auth', () {
  //   test('google', () async {});
  //   test('apple', () async {});
  // });
}
