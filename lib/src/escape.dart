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
