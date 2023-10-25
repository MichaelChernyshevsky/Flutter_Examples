// ignore_for_file: non_constant_identifier_names, file_names, lines_longer_than_80_chars

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';
import 'package:imaigination_mobile/constants/models/response.dart';
import 'package:imaigination_mobile/data/service/repo_service.dart';
import 'package:mockito/mockito.dart';

import '../../constants/constantsForTests.dart';
import '../../data/data_service_test.mocks.dart';
import '../../mocks/ServiceApi.mocks.dart';
import 'bloc_test.mocks.dart';

void serviceBloc_Tests() {
  final bloc = ServiceBloc(ServiceApi());

  group('Service Bloc emits', () {
    test('random', () async* {
      bloc.add(RandomEvent());
      await expectLater(
        bloc,
        emitsInOrder(
          [
            RandomSuccess(''),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    // test('history', () async* {
    //   bloc.add(HistoryEvent());
    //   await expectLater(
    //     bloc,
    //     emitsInOrder(
    //       [
    //         HistorySuccess(const []),
    //         ServiceWrong(status: 200),
    //       ],
    //     ),
    //   );
    // });
    test('liked', () async* {
      bloc.add(LikedEvent(1));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            LikedSuccess(const []),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('upscale', () async* {
      bloc.add(UpscaleEvent(generationId: 1, imageId: 2));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            ServiceLoading(),
            UpscaleSuccess(url: ''),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('dislike', () async* {
      bloc.add(DislikeEvent(2, 2));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            DislikeSuccess(),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('like', () async* {
      bloc.add(LikeEvent(2, 2));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            LikeSuccess(),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('delete', () async* {
      bloc.add(DeleteEvent(generationId: 1, imageId: 1));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            ServiceSuccess(),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('controlNetModels', () async* {
      bloc.add(ControlNetModelsEvent());
      await expectLater(
        bloc,
        emitsInOrder(
          [
            ServiceSuccess(),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('deffusionModels', () async* {
      bloc.add(DeffusionModelsEvent());
      await expectLater(
        bloc,
        emitsInOrder(
          [
            ServiceSuccess(),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('uploadImage', () async* {
      bloc.add(UploadImageEvent(crop: false, image: ''));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            ServiceSuccess(),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
    test('search', () async* {
      bloc.add(SearchEvent(1));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            SearchSuccess([]),
            HomeSuccess([]),
            ServiceWrong(status: 1),
          ],
        ),
      );
    });
    test('textToImage', () async* {
      bloc.add(
        TextToImageEvent(model: TextToImage(body: {})),
      );
      await expectLater(
        bloc,
        emitsInOrder(
          [
            ServiceLoading(),
            GenerationSuccess([]),
            ServiceWrong(status: 200),
          ],
        ),
      );
    });
  });
}
