import 'package:input_mask/input_mask.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    MaskOptions awesome;

    setUp(() {
      awesome = new MaskOptions();
    });

    test('First Test', () {
      expect(awesome.alias == null, isTrue);
    });
  });
}
