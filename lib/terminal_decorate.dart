enum Escape {
  cancelAll(0),
  bold(1),

  /// Also called "dim".
  faint(2),
  italic(3),
  underline(4),

  /// Usually unsupported.
  blink(5),

  /// Usually unsupported.
  rapidBlink(6),
  negative(7),

  /// Also called "hide".
  conceal(8),

  /// Usually unsupported.
  crossLine(9),

  /// Usually unsupported.
  doubleUnderline(21),

  // Cancel font decorations.
  cancelBoldOrFaint(22),
  cancelItalic(23),
  cancelUnderline(24),
  cancelBlink(25),
  cancelNegative(27),
  cancelConceal(28),
  cancelCrossLine(29),

  // Foreground decorations.
  foregroundBlack(30),
  foregroundRed(31),
  foregroundGreen(32),
  foregroundYellow(33),
  foregroundBlue(34),
  foregroundMagenta(35),
  foregroundCyan(36),
  foregroundWhite(37),
  customForeground(38),
  cancelForeground(39),

  // Background decoration.
  backgroundBlack(40),
  backgroundRed(41),
  backgroundGreen(42),
  backgroundYellow(43),
  backgroundBlue(44),
  backgroundMagenta(45),
  backgroundCyan(46),
  backgroundWhite(47),
  customBackground(48),
  cancelBackground(49),

  // Highlight foreground decoration.
  foregroundHiBlack(90),
  foregroundHiRed(91),
  foregroundHiGreen(92),
  foregroundHiYellow(93),
  foregroundHiBlue(94),
  foregroundHiMagenta(95),
  foregroundHiCyan(96),
  foregroundHiWhite(97),

  // Highlight background decoration.
  backgroundHiBlack(100),
  backgroundHiRed(101),
  backgroundHiGreen(102),
  backgroundHiYellow(103),
  backgroundHiBlue(104),
  backgroundHiMagenta(105),
  backgroundHiCyan(106),
  backgroundHiWhite(107);

  const Escape(this.code)
      : assert(code >= 0 && code <= 0xff, 'invalid code: $code (0~255)');

  final int code;

  @override
  String toString() => '\x1b[${code}m';

  static const foregroundColors = {
    foregroundBlack,
    foregroundRed,
    foregroundGreen,
    foregroundYellow,
    foregroundBlue,
    foregroundMagenta,
    foregroundCyan,
    foregroundHiBlack,
    foregroundHiRed,
    foregroundHiGreen,
    foregroundHiYellow,
    foregroundHiBlue,
    foregroundHiMagenta,
    foregroundHiCyan,
    foregroundHiWhite,
    customForeground,
  };

  static const backgroundColors = {
    backgroundBlack,
    backgroundRed,
    backgroundGreen,
    backgroundYellow,
    backgroundBlue,
    backgroundMagenta,
    backgroundCyan,
    backgroundHiBlack,
    backgroundHiRed,
    backgroundHiGreen,
    backgroundHiYellow,
    backgroundHiBlue,
    backgroundHiMagenta,
    backgroundHiCyan,
    backgroundHiWhite,
    customBackground,
  };
}

extension TerminalFontStyleDecorations on String {
  String get bold => '${Escape.bold}$this${Escape.cancelBoldOrFaint}';
  String get faint => '${Escape.faint}$this${Escape.cancelBoldOrFaint}';
  String get italic => '${Escape.italic}$this${Escape.cancelItalic}';
  String get underline => '${Escape.underline}$this${Escape.cancelUnderline}';
  String get blink => '${Escape.blink}$this${Escape.cancelBlink}';
  String get rapidBlink => '${Escape.rapidBlink}$this${Escape.cancelBlink}';
  String get negative => '${Escape.negative}$this${Escape.cancelNegative}';
  String get conceal => '${Escape.conceal}$this${Escape.cancelConceal}';
  String get crossLine => '${Escape.crossLine}$this${Escape.cancelCrossLine}';
  String get doubleUnderline =>
      '${Escape.doubleUnderline}$this${Escape.cancelUnderline}';

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
      '${code.code} is not a foreground code',
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
