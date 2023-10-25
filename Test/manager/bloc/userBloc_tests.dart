// ignore_for_file: non_constant_identifier_names, file_names

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';
import 'package:imaigination_mobile/data/service/repo_service.dart';
import 'package:mockito/mockito.dart';
import '../../mocks/ServiceApi.mocks.dart';
import '../../mocks/userRepo.mocks.dart';

void userBloc_Tests() {
  group('User Bloc', () {
    final UserRepo loggedInRepository = MockUserRepo();
    final ServiceApi service = MockServiceApi();
    final dataService = ServiceData(userRepo: loggedInRepository);

    GetIt.I.registerSingleton<ServiceData>(dataService);
    when(loggedInRepository.saveUserName('update'))
        .thenAnswer((_) => Future.value());

    when(service.postUser('update')).thenAnswer(
      (_) => Future.value(Response('success', 200)),
    );

    // when(service.postUser('')).thenAnswer(
    //   (_) => Future.value(Response('error', 500)),
    // );
    Matcher stateSuccess({required bool isSuccess}) {
      return isA<UserState>().having(
        (UserState state) => state is UserMethodSucces,
        'state is on',
        isSuccess,
      );
    }

    blocTest<UserBloc, UserState>(
      'postUser',
      build: () => UserBloc(service),
      act: (UserBloc bloc) {
        bloc.add(UserPostEvent(updateUser: 'update'));
        // bloc.add(UserPostEvent(updateUser: ''));
      },
      expect: () {
        return [
          stateSuccess(isSuccess: true),
          // stateIsOn(isSuccess: false),
        ];
      },
    );
  });
}
