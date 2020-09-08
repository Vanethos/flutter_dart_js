@JS()
library javascript_bundler;

import 'package:js/js.dart';

@JS('confirm')
external void showConfirm(String text);

@JS('v')
class V {
  @JS('camelCase')
  external static String camelCase(String text);
}

String toCamelCase(String text) => V.camelCase(text);
