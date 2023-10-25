// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/api/connections/common_api.dart';

import '../../constants/constantsForTests.dart';

Future serviceApi() async {
  final serviseApi = CommonApi();

  const id = 49;
  const imageId = 175102;
  const generationId = 47749;

  getHeaders() => {'Content-Type': 'application/json'};

  group('ServiceApi', () {
    test('liked list', () async {
      final response = await serviseApi.getLiked(
        getToken(),
        id,
      );
      expect(response.widgets.isNotEmpty, true);
    });

    test('like', () async {
      Future<bool> like() async {
        try {
          await serviseApi.postImageLike(
            generationId,
            imageId,
            getToken(),
          );
          return false;
        } catch (e) {
          return true;
        }
      }

      final error = await like();

      expect(error, false);
    });

    test('dislike', () async {
      Future<bool> dislike() async {
        try {
          await serviseApi.postImageDislike(
            generationId,
            imageId,
            getToken(),
          );
          return false;
        } catch (e) {
          return true;
        }
      }

      final error = await dislike();

      expect(error, false);
    });
    // // test('delete', () async {});
    test('search', () async {
      final widgets = await serviseApi.getSearch(
        1,
        'car',
        getHeaders(),
      );
      expect(widgets.widgets.isNotEmpty, true);
    });
    test('random', () async {
      final widgets = await serviseApi.getRandom(getHeaders());
      expect(widgets.text.isNotEmpty, true);
    });
    // test('history', () async {
    //   final widgets = await serviseApi.getHistory(id, getHeaders());
    //   expect(widgets.widgets.isNotEmpty, true);
    // });
  });
}
