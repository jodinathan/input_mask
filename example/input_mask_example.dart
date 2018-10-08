import 'dart:js';
import 'dart:html';
import 'package:input_mask/input_mask.dart';

main() {
  Mask mask;

  final inputElement = document.createElement('input');
  // or you can get it like:
  // @ViewChild('inp') InputElement inputElement;

  mask = new Mask(new MaskOptions(
      showMaskOnHover: false,
      alias: 'integer',
      rightAlign: false,
      oncomplete: allowInterop((dynamic a){
        String clean = mask.unmaskedvalue();

        print('Complete: $clean');
      }),
      onincomplete: allowInterop((dynamic a){
        print('Incomplete');
      }),
      oncleared: allowInterop((a){
        print('Cleared');
      })
  )).mask(inputElement);
}
