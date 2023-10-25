// ignore_for_file: unused_local_variable, flutter_style_todos, non_constant_identifier_names, lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';
import 'package:imaigination_mobile/data/service/repo_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mocks/userRepo.mocks.dart';

@GenerateMocks(<Type>[UserRepo])
Future dataService_Tests() async {
  void withoutLogin() {
    final UserRepo loggedOutRepository = MockUserRepo();

    final dataService = ServiceData(userRepo: loggedOutRepository);

    group('Repo + Data Service - withoutLogin', () {
      test('checkUser', () async {
        await dataService.initialize();
        expect(dataService.checkUser(), false);
      });
    });
  }

  void loggedIn() {
    const id = 1;
    const sub = true;
    const name = 'username';
    const token = '1111';
    const email = 'email@example.com';
    const feedback = false;
    const history = ['1'];

    // Initialize case
    final UserRepo loggedInRepository = MockUserRepo();
    //
    when(loggedInRepository.getId()).thenAnswer((_) => Future.value(id));
    when(loggedInRepository.checkSubscription())
        .thenAnswer((_) => Future.value(sub));
    when(loggedInRepository.getName()).thenAnswer((_) => Future.value(name));
    when(loggedInRepository.getToken()).thenAnswer((_) => Future.value(token));
    when(loggedInRepository.getEmail()).thenAnswer(
      (_) => Future.value(email),
    );
    when(loggedInRepository.checkLogin()).thenAnswer((_) => Future.value(true));

    // when(loggedInRepository.getPassword())
    //     .thenAnswer((_) => Future.value(password));
    when(loggedInRepository.getFeedback()).thenAnswer(
      (_) => Future.value(feedback),
    );
    when(loggedInRepository.getHistory()).thenAnswer(
      (_) => Future.value(
        history,
      ),
    );
    when(loggedInRepository.saveFeedback()).thenAnswer((_) async => true);

    final dataService = ServiceData(userRepo: loggedInRepository);
    group('Repo + Data Service - with login', () {
      test('check data', () async {
        await dataService.initialize();
        expect(dataService.checkUser(), true);
        expect(dataService.subscription, sub);
        expect(dataService.email, email);
        expect(dataService.id, id);
        expect(dataService.getProfileName(), name);
        expect(await dataService.getAccessToken(), token);
        expect(dataService.feedback, feedback);
        await dataService.setFeedback();
        expect(dataService.feedback, !feedback);
        expect(dataService.searchHistory, history);
      });
    });
  }

  withoutLogin();
  loggedIn();
}
