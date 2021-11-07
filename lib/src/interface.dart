@JS()
library mask;

import 'dart:async';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:js/js.dart';

import '../assets/inputmask.bundle.min.dart' deferred as bundle;

class JsInterop {
  static final Map<String, Future<bool>> _scriptFetched = {};

  static html.ScriptElement script(String buffer) => html.ScriptElement()
    ..async = true
    ..type = 'text/javascript'
    ..appendText(buffer);

  static bool hasContext(String contextCheck) {
    final ret = js.context.hasProperty(contextCheck) &&
        js.context[contextCheck] != null &&
        js.context[contextCheck].toString() != 'null';

    print('HasContext $contextCheck, $ret');

    return ret;
  }

  static Future<bool> safeAddScript(String name, String buffer,
      {String contextCheck}) async {
    contextCheck ??= name;
    assert(buffer?.isNotEmpty == true);

    if (hasContext(contextCheck)) return true;

    if (!_scriptFetched.containsKey(name)) {
      final c = Completer<bool>();

      print('AddingScript $name');
      _scriptFetched[name] = c.future;
      html.document.body.children.add(script(buffer));

      Timer.periodic(Duration(milliseconds: 300), (t) {
        if (hasContext(contextCheck)) {
          t.cancel();
          c.complete(true);
        }
      });
    }

    return _scriptFetched[name];
  }
}

Future<bool> enableInputMask() => bundle.loadLibrary().then((dynamic lib) =>
    JsInterop.safeAddScript('InputMask', bundle.buffer,
        contextCheck: 'Inputmask'));

@JS('Inputmask')
class InputMask {
  external factory InputMask(Options options);

  external InputMask mask(html.Element inp);

  external String unmaskedvalue();

  external void remove(html.Element inp);
}

@JS()
@anonymous
class Options {
  external String get mask;

  external void Function(Object) get oncomplete;

  external void Function(Object) get onincomplete;

  external void Function(Object) get oncleared;

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

  external factory Options(
      {String mask,
      void Function(Object) oncleared,
      void Function(Object) oncomplete,
      void Function(Object) onincomplete,
      MaskDefinitions definitions,
      bool insertMode,
      String alias,
      String radixPoint,
      String prefix,
      bool showMaskOnHover = false,
      int digits,
      bool clearMaskOnLostFocus,
      String disablePredictiveText = 'rtfm',
      bool rightAlign = false});
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

  external factory MaskDefinition(
      {String validator, int cardinality, String casing});
}
