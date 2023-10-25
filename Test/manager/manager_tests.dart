// ignore_for_file: unused_import, non_constant_identifier_names

import 'bloc/authBloc_tests.dart';
import 'bloc/serviceBloc_tests.dart';
import 'bloc/userBloc_tests.dart';
import 'provider/appProvider_test.dart';

void manager_Tests() {
  authBloc_Tests();
  userBloc_Tests();
  serviceBloc_Tests();
  appProvider();
}
