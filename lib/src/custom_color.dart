import 'escape.dart';

/// A custom color for terminal output.
/// It can be either a [TerminalCodeColor] or [TerminalRGBColor].
abstract class TerminalCustomColor {
  /// Generate the [Escape] that decorate the text with such background color.
  Escape get background;

  /// Generate the [Escape] that decorate the text with such foreground color.
  Escape get foreground;
}

class TerminalCodeColor implements TerminalCustomColor {
  const TerminalCodeColor(this.code) : assert(code >= 0 && code <= 0xff);

  final int code;

  @override
  Escape get background => Escape(
        BackgroundCode.custom,
        parameters: [CustomTypeCode.code, code],
      );

  @override
  Escape get foreground => Escape(
        ForegroundCode.custom,
        parameters: [CustomTypeCode.code, code],
      );

  @override
  String toString() => '$TerminalCodeColor($code)';
}

class TerminalRGBColor implements TerminalCustomColor {
  const TerminalRGBColor(this.red, this.green, this.blue)
      : assert(red >= 0 && red <= 0xff),
        assert(green >= 0 && green <= 0xff),
        assert(blue >= 0 && blue <= 0xff);

  final int red;
  final int green;
  final int blue;

  @override
  Escape get foreground => Escape(
        ForegroundCode.custom,
        parameters: [CustomTypeCode.rgb, red, green, blue],
      );

  @override
  Escape get background => Escape(
        BackgroundCode.custom,
        parameters: [CustomTypeCode.rgb, red, green, blue],
      );

  @override
  String toString() => '$TerminalRGBColor($red, $green, $blue)';
}

extension CustomTypeCode on int {
  static const code = 5;
  static const rgb = 2;
}

extension CustomColor on String {
  String foreground(TerminalCustomColor color) => resolveNestEscape(
        color.foreground,
        Escape(CancelCode.foreground),
        overrides: ForegroundCode.all,
      );

  String background(TerminalCustomColor color) => resolveNestEscape(
        color.background,
        Escape(CancelCode.background),
        overrides: BackgroundCode.all,
      );
}
