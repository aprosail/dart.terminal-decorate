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
  black(30),
  red(31),
  green(32),
  yellow(33),
  blue(34),
  magenta(35),
  cyan(36),
  white(37),
  customizeFg(38),
  cancelFg(39),

  // Bg decoration.
  bgBlack(40),
  bgRed(41),
  bgGreen(42),
  bgYellow(43),
  bgBlue(44),
  bgMagenta(45),
  bgCyan(46),
  bgWhite(47),
  customizeBg(48),
  cancelBg(49);

  const Escape(this.code)
      : assert(code >= 0 && code <= 0xff, 'invalid code: $code (0~255)');

  final int code;

  String get format => '\x1b[${code}m';

  @override
  String toString() => format;
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

  // Syntax sugars.
  String get dim => faint;
  String get hide => conceal;
}

extension TerminalColorDecorations on String {
  // Foreground.
  String get black => '${Escape.black}$this${Escape.cancelFg}';
  String get red => '${Escape.red}$this${Escape.cancelFg}';
  String get green => '${Escape.green}$this${Escape.cancelFg}';
  String get yellow => '${Escape.yellow}$this${Escape.cancelFg}';
  String get blue => '${Escape.blue}$this${Escape.cancelFg}';
  String get magenta => '${Escape.magenta}$this${Escape.cancelFg}';
  String get cyan => '${Escape.cyan}$this${Escape.cancelFg}';
  String get white => '${Escape.white}$this${Escape.cancelFg}';

  // Background.
  String get bgBlack => '${Escape.bgBlack}$this${Escape.cancelBg}';
  String get bgRed => '${Escape.bgRed}$this${Escape.cancelBg}';
  String get bgGreen => '${Escape.bgGreen}$this${Escape.cancelBg}';
  String get bgYellow => '${Escape.bgYellow}$this${Escape.cancelBg}';
  String get bgBlue => '${Escape.bgBlue}$this${Escape.cancelBg}';
  String get bgMagenta => '${Escape.bgMagenta}$this${Escape.cancelBg}';
  String get bgCyan => '${Escape.bgCyan}$this${Escape.cancelBg}';
  String get bgWhite => '${Escape.bgWhite}$this${Escape.cancelBg}';
}
