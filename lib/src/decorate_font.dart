import 'escape.dart';
import 'wrap.dart';

extension TerminalFontStyleBoldAndFaint on String {
  String get bold => resolveNestEscape(
        Escape.bold,
        Escape.cancelBoldOrFaint,
        conflicts: {Escape.faint},
      );

  String get faint => resolveNestEscape(
        Escape.faint,
        Escape.cancelBoldOrFaint,
        conflicts: {Escape.bold},
      );
}

extension TerminalFontStyleBlink on String {
  String get blink => resolveNestEscape(
        Escape.blink,
        Escape.cancelBlink,
        conflicts: {Escape.rapidBlink},
      );

  String get rapidBlink => resolveNestEscape(
        Escape.rapidBlink,
        Escape.cancelBlink,
        conflicts: {Escape.blink},
      );
}

extension TerminalFontStyleUnderline on String {
  String get underline => resolveNestEscape(
        Escape.underline,
        Escape.cancelUnderline,
        conflicts: {Escape.doubleUnderline},
      );

  String get doubleUnderline => resolveNestEscape(
        Escape.doubleUnderline,
        Escape.cancelUnderline,
        conflicts: {Escape.underline},
      );
}

extension TerminalFontStyleDecorations on String {
  String get italic => wrapEscape(Escape.italic, Escape.cancelItalic);
  String get negative => wrapEscape(Escape.negative, Escape.cancelNegative);
  String get conceal => wrapEscape(Escape.conceal, Escape.cancelConceal);
  String get crossLine => wrapEscape(Escape.crossLine, Escape.cancelCrossLine);
}

extension TerminalFontStyleDecorationAliases on String {
  String get dim => faint;
  String get hide => conceal;
}
