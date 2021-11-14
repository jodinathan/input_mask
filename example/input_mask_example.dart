import 'dart:html';
import 'dart:js';

import 'package:input_mask/input_mask.dart';

void main() {
  late InputMask mask;

  final inputElement = document.createElement('input');
  // or you can get it like:
  // @ViewChild('inp') InputElement inputElement;

  mask = InputMask(Options(
      showMaskOnHover: false,
      alias: 'integer',
      rightAlign: false,
      oncomplete: allowInterop((dynamic a) {
        final clean = mask.unmaskedvalue();

        print('Complete: $clean');
      }),
      onincomplete: allowInterop((dynamic a) {
        print('Incomplete');
      }),
      oncleared: allowInterop((a){
        print('Cleared');
      })
  )).mask(inputElement);
}
