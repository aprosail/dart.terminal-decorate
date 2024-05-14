import 'escape.dart';

extension TerminalFontStyleBoldAndFaint on String {
  String get bold => resolveNestEscape(
        const Escape(FontStyleCode.bold),
        const Escape(CancelCode.boldOrFaint),
        conflicts: {FontStyleCode.faint},
      );

  String get faint => resolveNestEscape(
        const Escape(FontStyleCode.faint),
        const Escape(CancelCode.boldOrFaint),
        conflicts: {FontStyleCode.bold},
      );
}

extension TerminalFontStyleBlink on String {
  String get blink => resolveNestEscape(
        const Escape(FontStyleCode.blink),
        const Escape(CancelCode.blink),
        conflicts: {FontStyleCode.blinkRapid},
      );

  String get blinkRapid => resolveNestEscape(
        const Escape(FontStyleCode.blinkRapid),
        const Escape(CancelCode.blink),
        conflicts: {FontStyleCode.blink},
      );
}

extension TerminalFontStyleUnderline on String {
  String get underline => resolveNestEscape(
        const Escape(FontStyleCode.underline),
        const Escape(CancelCode.underline),
        conflicts: {FontStyleCode.doubleUnderline},
      );

  String get doubleUnderline => resolveNestEscape(
        const Escape(FontStyleCode.doubleUnderline),
        const Escape(CancelCode.underline),
        conflicts: {FontStyleCode.underline},
      );
}

extension TerminalFontStyleDecorations on String {
  String get italic => wrapEscape(
        const Escape(FontStyleCode.italic),
        const Escape(CancelCode.italic),
      );

  String get negative => wrapEscape(
        const Escape(FontStyleCode.negative),
        const Escape(CancelCode.negative),
      );

  String get conceal => wrapEscape(
        const Escape(FontStyleCode.conceal),
        const Escape(CancelCode.conceal),
      );

  String get strikethrough => wrapEscape(
        const Escape(FontStyleCode.strikethrough),
        const Escape(CancelCode.strikethrough),
      );
}

extension TerminalFontStyleDecorationAliases on String {
  String get dim => faint;
  String get hide => conceal;
  String get blinkFast => blinkRapid;
  String get blinkSlow => blink;
  String get reverse => negative;
  String get delete => strikethrough;
  String get lineThrough => strikethrough;
}
