import 'escape.dart';

extension CustomTypeCode on int {
  static const code = 5;
  static const rgb = 2;
}

extension CustomColor on String {
  String foregroundCode(int code) => resolveNestEscape(
        Escape(ForegroundCode.custom, parameters: [CustomTypeCode.code, code]),
        Escape(CancelCode.foreground),
        overrides: ForegroundCode.all,
      );

  String backgroundCode(int code) => resolveNestEscape(
        Escape(ForegroundCode.custom, parameters: [CustomTypeCode.code, code]),
        Escape(CancelCode.background),
        overrides: BackgroundCode.all,
      );

  String foregroundRGB(int red, int green, int blue) => resolveNestEscape(
        Escape(
          ForegroundCode.custom,
          parameters: [CustomTypeCode.rgb, red, green, blue],
        ),
        Escape(CancelCode.foreground),
        overrides: ForegroundCode.all,
      );

  String backgroundRGB(int red, int green, int blue) => resolveNestEscape(
        Escape(
          BackgroundCode.custom,
          parameters: [CustomTypeCode.rgb, red, green, blue],
        ),
        Escape(CancelCode.background),
        overrides: BackgroundCode.all,
      );
}
