import 'package:flutter_test/flutter_test.dart';
import 'package:imaigination_mobile/api/funcs/ratio.dart';

void ratioTest() {
  test('ApiFunc - getRatio', () {
    const width = 50;
    const height = 100;
    final ratio = getAspectPatio(width, height);
    expect(ratio, 0.5);
  });
}
