import 'escape.dart';

extension TerminalForegroundDecorations on String {
  String _foregroundColor(int code) {
    assert(ForegroundCode.all.contains(code), 'not a foreground code: $code');
    return resolveNestEscape(
      Escape(code),
      const Escape(CancelCode.foreground),
      overrides: ForegroundCode.allAndCustom.toSet()..remove(code),
    );
  }

  String get foregroundBlack => _foregroundColor(ForegroundCode.black);
  String get foregroundWhite => _foregroundColor(ForegroundCode.white);
  String get foregroundRed => _foregroundColor(ForegroundCode.red);
  String get foregroundYellow => _foregroundColor(ForegroundCode.yellow);
  String get foregroundGreen => _foregroundColor(ForegroundCode.green);
  String get foregroundCyan => _foregroundColor(ForegroundCode.cyan);
  String get foregroundBlue => _foregroundColor(ForegroundCode.blue);
  String get foregroundMagenta => _foregroundColor(ForegroundCode.magenta);

  String get foregroundHiBlack => _foregroundColor(HiForegroundCode.black);
  String get foregroundHiWhite => _foregroundColor(HiForegroundCode.white);
  String get foregroundHiRed => _foregroundColor(HiForegroundCode.red);
  String get foregroundHiYellow => _foregroundColor(HiForegroundCode.yellow);
  String get foregroundHiGreen => _foregroundColor(HiForegroundCode.green);
  String get foregroundHiCyan => _foregroundColor(HiForegroundCode.cyan);
  String get foregroundHiBlue => _foregroundColor(HiForegroundCode.blue);
  String get foregroundHiMagenta => _foregroundColor(
        HiForegroundCode.magenta,
      );
}

extension TerminalBackgroundDecoration on String {
  String _backgroundColor(int code) {
    assert(BackgroundCode.all.contains(code), 'not a background code: $code');
    return resolveNestEscape(
      Escape(code),
      const Escape(CancelCode.background),
      overrides: BackgroundCode.allAndCustom.toSet()..remove(code),
    );
  }

  String get backgroundBlack => _backgroundColor(BackgroundCode.black);
  String get backgroundWhite => _backgroundColor(BackgroundCode.white);
  String get backgroundRed => _backgroundColor(BackgroundCode.red);
  String get backgroundYellow => _backgroundColor(BackgroundCode.yellow);
  String get backgroundGreen => _backgroundColor(BackgroundCode.green);
  String get backgroundCyan => _backgroundColor(BackgroundCode.cyan);
  String get backgroundBlue => _backgroundColor(BackgroundCode.blue);
  String get backgroundMagenta => _backgroundColor(BackgroundCode.magenta);

  String get backgroundHiBlack => _backgroundColor(HiBackgroundCode.black);
  String get backgroundHiWhite => _backgroundColor(HiBackgroundCode.white);
  String get backgroundHiRed => _backgroundColor(HiBackgroundCode.red);
  String get backgroundHiYellow => _backgroundColor(HiBackgroundCode.yellow);
  String get backgroundHiGreen => _backgroundColor(HiBackgroundCode.green);
  String get backgroundHiCyan => _backgroundColor(HiBackgroundCode.cyan);
  String get backgroundHiBlue => _backgroundColor(HiBackgroundCode.blue);
  String get backgroundHiMagenta => _backgroundColor(HiBackgroundCode.magenta);
}

extension TerminalForegroundDecorationAliases on String {
  String get black => foregroundBlack;
  String get red => foregroundRed;
  String get yellow => foregroundYellow;
  String get green => foregroundGreen;
  String get cyan => foregroundCyan;
  String get blue => foregroundBlue;
  String get magenta => foregroundMagenta;
  String get white => foregroundWhite;

  String get hiBlack => foregroundHiBlack;
  String get hiRed => foregroundHiRed;
  String get hiYellow => foregroundHiYellow;
  String get hiGreen => foregroundHiGreen;
  String get hiCyan => foregroundHiCyan;
  String get hiBlue => foregroundHiBlue;
  String get hiMagenta => foregroundHiMagenta;
  String get hiWhite => foregroundHiWhite;
}

extension TerminalBackgroundDecorationAliases on String {
  String get bgBlack => backgroundBlack;
  String get bgRed => backgroundRed;
  String get bgYellow => backgroundYellow;
  String get bgGreen => backgroundGreen;
  String get bgCyan => backgroundCyan;
  String get bgBlue => backgroundBlue;
  String get bgMagenta => backgroundMagenta;
  String get bgWhite => backgroundWhite;

  String get bgHiBlack => backgroundHiBlack;
  String get bgHiRed => backgroundHiRed;
  String get bgHiYellow => backgroundHiYellow;
  String get bgHiGreen => backgroundHiGreen;
  String get bgHiCyan => backgroundHiCyan;
  String get bgHiBlue => backgroundHiBlue;
  String get bgHiMagenta => backgroundHiMagenta;
  String get bgHiWhite => backgroundHiWhite;
}
