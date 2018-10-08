@JS()
library mask;

import 'dart:html' as html;
import 'package:js/js.dart';

@JS('Inputmask')
class Mask {
  external factory Mask(MaskOptions options);

  external Mask mask(html.HtmlElement inp);
  external String unmaskedvalue();
}

@JS()
@anonymous
class MaskOptions {
  external String get mask;
  external Function(dynamic) get oncomplete;
  external Function(dynamic) get onincomplete;
  external Function(dynamic) get oncleared;
  external MaskDefinitions get definitions;
  external bool get insertMode;
  external String get alias;
  external String get radixPoint;
  external String get prefix;
  external int get digits;
  external bool get clearMaskOnLostFocus;
  external String get disablePredictiveText;
  external String get showMaskOnHover;
  external bool get rightAlign;

  external factory MaskOptions({String mask, Function(dynamic) oncleared,
    Function(dynamic) oncomplete, Function(dynamic) onincomplete,
    MaskDefinitions definitions, bool insertMode, String alias,
    String radixPoint, String prefix, bool showMaskOnHover: false,
    int digits, bool clearMaskOnLostFocus,
    String disablePredictiveText: 'rtfm', bool rightAlign: false});
}

@JS()
@anonymous
class MaskDefinitions {
  external MaskDefinition get X;

  external factory MaskDefinitions({MaskDefinition X});
}

@JS()
@anonymous
class MaskDefinition {
  external String get validator;
  external int get cardinality;
  external String get casing;

  external factory MaskDefinition({String validator, int cardinality, String casing});
}
