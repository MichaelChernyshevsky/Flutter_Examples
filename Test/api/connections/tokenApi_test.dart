import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/constants/exports/hidden_export.dart';

Future tokenApi(rundomNumber, password, email) async {
  group('Token', () {
    final token = TokenApi();
    test('getToken', () async {
      final response = await token
          .getToken(email, password, {'Content-Type': 'application/json'});

      expect(response.status, AppLocalizations.current.success);
    });
  });
}
