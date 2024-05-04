enum Escape {
  // || ==================================================================== ||
  // ||                        Font style decorations                        ||
  // || ==================================================================== ||
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
  crossLine(9),

  /// Usually unsupported.
  doubleUnderline(21),

  // || ==================================================================== ||
  // ||                    Cancel font style decorations                     ||
  // || ==================================================================== ||
  cancelBoldOrFaint(22),
  cancelItalic(23),
  cancelUnderline(24),
  cancelBlink(25),
  cancelNegative(27),
  cancelConceal(28),
  cancelCrossLine(29);

  const Escape(this.code)
      : assert(code >= 0 && code <= 0xff, 'invalid code: $code (0~255)');

  final int code;

  String get format => '\x1b[${code}m';

  @override
  String toString() => format;
}

extension TerminalDecorationBasic on String {
  // Font style decorations.
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
