// ignore_for_file: unused_import, unused_local_variable,
//ignore_for_file: file_names, non_constant_identifier_names

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';
import 'package:imaigination_mobile/data/service/repo_service.dart';
import 'package:mockito/mockito.dart';

import '../../constants/constantsForTests.dart';
import '../../mocks/userRepo.mocks.dart';
import 'bloc_test.mocks.dart';

void authBloc_Tests() {
  final UserRepo loggedInRepository = MockUserRepo();
  // final ServiceApi service = MockServiceData();
  final dataService = ServiceData(userRepo: loggedInRepository);

  group('Auth Bloc emits', () {
    final bloc = AuthBloc(ServiceApi());
    test('login', () async* {
      bloc.add(LoginEvent(email: '', password: ''));
      await expectLater(
        bloc,
        emitsInOrder(
          [
            AuthLoading(),
            AuthError(),
            AuthSuccessful(),
          ],
        ),
      );
    });
    test('registration', () async* {
      bloc.add(RegistrationEvent());
      await expectLater(
        bloc,
        emitsInOrder(
          [
            AuthRegistration(),
            AuthError(),
            AuthSuccessful(),
          ],
        ),
      );
    });
    test('checkVerification', () async* {
      bloc.add(ConfirmVerification());
      await expectLater(
        bloc,
        emitsInOrder(
          [
            IsCheckingCode(),
            ConfirmedCode(),
            InvalideCode(),
          ],
        ),
      );
    });
    test('sendMail', () async* {
      bloc.add(SendMailEvent());
      await expectLater(
        bloc,
        emitsInOrder(
          [
            IsMailSending(),
            MailSended(),
            MailSendError(),
          ],
        ),
      );
    });
  });

  // group('AuthBloc', () {

  //   group('', () {
  //     when(
  //       service.setNewPassword(
  //         someString(),
  //         someString(),
  //         someString(),
  //       ),
  //     ).thenAnswer(
  //       (_) => Future.value(
  //         Response(
  //           'success',
  //           200,
  //         ),
  //       ),
  //     );
  //     Matcher statePasswordLoading({required bool isSuccess}) {
  //       return isA<AuthState>().having(
  //         (AuthState state) => state is IsPasswordSetting,
  //         'state is on',
  //         isSuccess,
  //       );
  //     }

  //     Matcher statePassword({required bool isSuccess}) {
  //       return isA<AuthState>().having(
  //         (AuthState state) => state is SuccessSetPassword,
  //         'state is on',
  //         isSuccess,
  //       );
  //     }

  //     blocTest(
  //       'SetNewPassword',
  //       build: () => AuthBloc(service),
  //       act: (AuthBloc bloc) {
  //         bloc.add(
  //           SetNewPassword(
  //             token: someString(),
  //             email: someString(),
  //             password: someString(),
  //           ),
  //         );
  //       },
  //       expect: () {
  //         return [
  //           statePasswordLoading(isSuccess: true),
  //           statePassword(isSuccess: true),
  //         ];
  //       },
  //     );
  //   });

  //   group('', () {
  //     when(service.logOut()).thenAnswer(
  //       (_) => Future.value(AppLocalizations.current.success),
  //     );
  //     blocTest(
  //       'logout',
  //       build: () => AuthBloc(service),
  //       act: (AuthBloc bloc) {
  //         bloc.add(
  //           LogoutEvent(),
  //         );
  //       },
  //       expect: () {
  //         return [
  //           stateSuccess(isSuccess: true),
  //         ];
  //       },
  //     );
  //   });

  //   group('',(){
  //   when(service.login(someString(),someString(),)).thenAnswer(
  //     (_) => Future.value(Response('success', 200)),
  //   );
  //   blocTest('login',  build: () => AuthBloc(service),
  //       act: (AuthBloc bloc) {
  //         bloc.add(
  //           LoginEvent( someString(),someString(),),
  //         );
  //       },
  //       expect: () {
  //         return [
  //           stateSuccess(isSuccess: true),
  //         ];
  //       },); });

  //   //group('',(){
  //   //when(service.search(someInt(), request)).thenAnswer(
  //   //   (_) => Future.value(Response('success', 200)),
  //   //  );
  //   //  blocTest('registration', () => null); });

  //   //group('',(){
  //   //when(service.search(someInt(), request)).thenAnswer(
  //   //    (_) => Future.value(Response('success', 200)),
  //   //  );
  //   // blocTest('checkVerification', () => null); });

  //   //group('',(){
  //   //when(service.search(someInt(), request)).thenAnswer(
  //   //    (_) => Future.value(Response('success', 200)),
  //   //  );
  //   //  blocTest('sendMail', () => null); });

  //   //group('',(){
  //   //when(service.search(someInt(), request)).thenAnswer(
  //   //     (_) => Future.value(Response('success', 200)),
  //   //  );
  //   //  blocTest('googleLogin', () => null); });

  //   //group('',(){
  //   //when(service.search(someInt(), request)).thenAnswer(
  //   //   (_) => Future.value(Response('success', 200)),
  //   //   );
  //   //    blocTest('appleLogin', () => null); });
  // });
}

Matcher stateSuccess({required bool isSuccess}) {
  return isA<AuthState>().having(
    (AuthState state) => state is AuthSuccessful,
    'state is on',
    isSuccess,
  );
}
