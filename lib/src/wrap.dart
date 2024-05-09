import 'escape.dart';

extension WrapTerminalDecorations on String {
  String wrapEscape(Escape prefix, Escape suffix) => '$prefix$this$suffix';
}
