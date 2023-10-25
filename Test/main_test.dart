// ignore_for_file: avoid_print, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:imaigination_mobile/constants/exports/pages_export.dart';
import 'package:imaigination_mobile/firebase_options.dart';
import 'package:mockito/annotations.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api/apiTests.dart';
import 'data/data_service_test.dart';
import 'manager/manager_tests.dart';

int getRandomNumber() {
  Random rnd;
  const min = 1;
  const max = 100000;
  rnd = Random();
  return min + rnd.nextInt(max - min);
}

typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  WidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}

// @GenerateNiceMocks([MockSpec<ServiceApi>()])
void main() {
  // setupFirebaseAuthMocks();

  // setUpAll(() async {
  //   await Firebase.initializeApp();
  // });

  api_Tests(getRandomNumber());

  manager_Tests();

  dataService_Tests();
}
