import 'escape.dart';
import 'wrap.dart';

extension TerminalFontStyleDecorations on String {
  String get bold => wrapEscape(Escape.bold, Escape.cancelBoldOrFaint);
  String get faint => wrapEscape(Escape.faint, Escape.cancelBoldOrFaint);
  String get italic => wrapEscape(Escape.italic, Escape.cancelItalic);
  String get underline => wrapEscape(Escape.underline, Escape.cancelUnderline);
  String get blink => wrapEscape(Escape.blink, Escape.cancelBlink);
  String get rapidBlink => wrapEscape(Escape.rapidBlink, Escape.cancelBlink);
  String get negative => wrapEscape(Escape.negative, Escape.cancelNegative);
  String get conceal => wrapEscape(Escape.conceal, Escape.cancelConceal);
  String get crossLine => wrapEscape(Escape.crossLine, Escape.cancelCrossLine);
  String get doubleUnderline => wrapEscape(
        Escape.doubleUnderline,
        Escape.cancelUnderline,
      );

  String get dim => faint;
  String get hide => conceal;
}

extension TerminalForegroundDecorations on String {
  String _foregroundColor(Escape code) {
    assert(
      Escape.foregroundColors.contains(code),
      '${code.code} is not a foreground code',
    );

    final index = lastIndexOf(Escape.cancelForeground.toString());
    final signLength = Escape.cancelForeground.toString().length;
    return index == -1
        ? '$code$this${Escape.cancelForeground}'
        : '$code${substring(0, index + signLength)}'
            '$code${substring(index + signLength)}${Escape.cancelForeground}';
  }

  String get foregroundBlack => _foregroundColor(Escape.foregroundBlack);
  String get foregroundRed => _foregroundColor(Escape.foregroundRed);
  String get foregroundYellow => _foregroundColor(Escape.foregroundYellow);
  String get foregroundGreen => _foregroundColor(Escape.foregroundGreen);
  String get foregroundCyan => _foregroundColor(Escape.foregroundCyan);
  String get foregroundBlue => _foregroundColor(Escape.foregroundBlue);
  String get foregroundMagenta => _foregroundColor(Escape.foregroundMagenta);
  String get foregroundWhite => _foregroundColor(Escape.foregroundWhite);

  String get black => foregroundBlack;
  String get red => foregroundRed;
  String get yellow => foregroundYellow;
  String get green => foregroundGreen;
  String get cyan => foregroundCyan;
  String get blue => foregroundBlue;
  String get magenta => foregroundMagenta;
  String get white => foregroundWhite;

  String get foregroundHiBlack => _foregroundColor(Escape.foregroundHiBlack);
  String get foregroundHiRed => _foregroundColor(Escape.foregroundHiRed);
  String get foregroundHiYellow => _foregroundColor(Escape.foregroundHiYellow);
  String get foregroundHiGreen => _foregroundColor(Escape.foregroundHiGreen);
  String get foregroundHiBlue => _foregroundColor(Escape.foregroundHiBlue);
  String get foregroundHiCyan => _foregroundColor(Escape.foregroundHiCyan);
  String get foregroundHiMagenta =>
      _foregroundColor(Escape.foregroundHiMagenta);
  String get foregroundHiWhite => _foregroundColor(Escape.foregroundHiWhite);

  String get hiBlack => foregroundHiBlack;
  String get hiRed => foregroundHiRed;
  String get hiYellow => foregroundHiYellow;
  String get hiGreen => foregroundHiGreen;
  String get hiCyan => foregroundHiCyan;
  String get hiBlue => foregroundHiBlue;
  String get hiMagenta => foregroundHiMagenta;
  String get hiWhite => foregroundHiWhite;
}

extension TerminalBackgroundDecoration on String {
  String _backgroundColor(Escape code) {
    assert(
      Escape.backgroundColors.contains(code),
      '${code.code} is not a background code',
    );

    final index = lastIndexOf(Escape.cancelBackground.toString());
    final signLength = Escape.cancelBackground.toString().length;
    return index == -1
        ? '$code$this${Escape.cancelBackground}'
        : '$code${substring(0, index + signLength)}'
            '$code${substring(index + signLength)}${Escape.cancelBackground}';
  }

  String get backgroundBlack => _backgroundColor(Escape.backgroundBlack);
  String get backgroundRed => _backgroundColor(Escape.backgroundRed);
  String get backgroundYellow => _backgroundColor(Escape.backgroundYellow);
  String get backgroundGreen => _backgroundColor(Escape.backgroundGreen);
  String get backgroundCyan => _backgroundColor(Escape.backgroundCyan);
  String get backgroundBlue => _backgroundColor(Escape.backgroundBlue);
  String get backgroundMagenta => _backgroundColor(Escape.backgroundMagenta);
  String get backgroundWhite => _backgroundColor(Escape.backgroundWhite);

  String get bgBlack => backgroundBlack;
  String get bgRed => backgroundRed;
  String get bgYellow => backgroundYellow;
  String get bgGreen => backgroundGreen;
  String get bgCyan => backgroundCyan;
  String get bgBlue => backgroundBlue;
  String get bgMagenta => backgroundMagenta;
  String get bgWhite => backgroundWhite;

  String get backgroundHiBlack => _backgroundColor(Escape.backgroundHiBlack);
  String get backgroundHiRed => _backgroundColor(Escape.backgroundHiRed);
  String get backgroundHiYellow => _backgroundColor(Escape.backgroundHiYellow);
  String get backgroundHiGreen => _backgroundColor(Escape.backgroundHiGreen);
  String get backgroundHiBlue => _backgroundColor(Escape.backgroundHiBlue);
  String get backgroundHiCyan => _backgroundColor(Escape.backgroundHiCyan);
  String get backgroundHiMagenta =>
      _backgroundColor(Escape.backgroundHiMagenta);
  String get backgroundHiWhite => _backgroundColor(Escape.backgroundHiWhite);

  String get bgHiBlack => backgroundHiBlack;
  String get bgHiRed => backgroundHiRed;
  String get bgHiYellow => backgroundHiYellow;
  String get bgHiGreen => backgroundHiGreen;
  String get bgHiCyan => backgroundHiCyan;
  String get bgHiBlue => backgroundHiBlue;
  String get bgHiMagenta => backgroundHiMagenta;
  String get bgHiWhite => backgroundHiWhite;
}
