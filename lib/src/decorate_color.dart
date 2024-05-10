import 'package:terminal_decorate/terminal_decorate.dart';

extension TerminalForegroundDecorations on String {
  String _foregroundColor(Escape code) => resolveNestEscape(
        code,
        Escape.cancelForeground,
        overrides: {
          Escape.foregroundBlack,
          Escape.foregroundRed,
          Escape.foregroundYellow,
          Escape.foregroundGreen,
          Escape.foregroundCyan,
          Escape.foregroundBlue,
          Escape.foregroundMagenta,
          Escape.foregroundWhite,
          Escape.foregroundHiBlack,
          Escape.foregroundHiRed,
          Escape.foregroundHiYellow,
          Escape.foregroundHiGreen,
          Escape.foregroundHiCyan,
          Escape.foregroundHiBlue,
          Escape.foregroundHiMagenta,
          Escape.foregroundHiWhite,
        }..remove(code),
      );

  String get foregroundBlack => _foregroundColor(Escape.foregroundBlack);
  String get foregroundWhite => _foregroundColor(Escape.foregroundWhite);
  String get foregroundRed => _foregroundColor(Escape.foregroundRed);
  String get foregroundYellow => _foregroundColor(Escape.foregroundYellow);
  String get foregroundGreen => _foregroundColor(Escape.foregroundGreen);
  String get foregroundCyan => _foregroundColor(Escape.foregroundCyan);
  String get foregroundBlue => _foregroundColor(Escape.foregroundBlue);
  String get foregroundMagenta => _foregroundColor(Escape.foregroundMagenta);

  String get foregroundHiBlack => _foregroundColor(Escape.foregroundHiBlack);
  String get foregroundHiWhite => _foregroundColor(Escape.foregroundHiWhite);
  String get foregroundHiRed => _foregroundColor(Escape.foregroundHiRed);
  String get foregroundHiYellow => _foregroundColor(Escape.foregroundHiYellow);
  String get foregroundHiGreen => _foregroundColor(Escape.foregroundHiGreen);
  String get foregroundHiBlue => _foregroundColor(Escape.foregroundHiBlue);
  String get foregroundHiCyan => _foregroundColor(Escape.foregroundHiCyan);
  String get foregroundHiMagenta => _foregroundColor(
        Escape.foregroundHiMagenta,
      );
}

extension TerminalBackgroundDecoration on String {
  String _backgroundColor(Escape code) => resolveNestEscape(
        code,
        Escape.cancelBackground,
        overrides: {
          Escape.backgroundBlack,
          Escape.backgroundRed,
          Escape.backgroundGreen,
          Escape.backgroundYellow,
          Escape.backgroundBlue,
          Escape.backgroundMagenta,
          Escape.backgroundCyan,
          Escape.backgroundWhite,
          Escape.backgroundHiBlack,
          Escape.backgroundHiRed,
          Escape.backgroundHiGreen,
          Escape.backgroundHiYellow,
          Escape.backgroundHiBlue,
          Escape.backgroundHiMagenta,
          Escape.backgroundHiCyan,
          Escape.backgroundHiWhite,
        }..remove(code),
      );

  String get backgroundBlack => _backgroundColor(Escape.backgroundBlack);
  String get backgroundWhite => _backgroundColor(Escape.backgroundWhite);
  String get backgroundRed => _backgroundColor(Escape.backgroundRed);
  String get backgroundYellow => _backgroundColor(Escape.backgroundYellow);
  String get backgroundGreen => _backgroundColor(Escape.backgroundGreen);
  String get backgroundCyan => _backgroundColor(Escape.backgroundCyan);
  String get backgroundBlue => _backgroundColor(Escape.backgroundBlue);
  String get backgroundMagenta => _backgroundColor(Escape.backgroundMagenta);

  String get backgroundHiBlack => _backgroundColor(Escape.backgroundHiBlack);
  String get backgroundHiWhite => _backgroundColor(Escape.backgroundHiWhite);
  String get backgroundHiRed => _backgroundColor(Escape.backgroundHiRed);
  String get backgroundHiYellow => _backgroundColor(Escape.backgroundHiYellow);
  String get backgroundHiGreen => _backgroundColor(Escape.backgroundHiGreen);
  String get backgroundHiBlue => _backgroundColor(Escape.backgroundHiBlue);
  String get backgroundHiCyan => _backgroundColor(Escape.backgroundHiCyan);
  String get backgroundHiMagenta => _backgroundColor(
        Escape.backgroundHiMagenta,
      );
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
