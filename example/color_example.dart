// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:terminal_decorate/terminal_decorate.dart';

void main() => colorExample();

void colorExample() {
  for (final line in singleForegroundLines) print(line);
  for (final line in singleBackgroundLines) print(line);
  print(complexForegroundLine());
  print(complexBackgroundLine());
}

final singleForegroundLines = [
  singleForegroundLine(
    code: ForegroundCode.black,
    content: 'black'.black,
    comment: 'black, sometimes dark gray',
  ),
  singleForegroundLine(code: ForegroundCode.red, content: 'red'.red),
  singleForegroundLine(code: ForegroundCode.yellow, content: 'yellow'.yellow),
  singleForegroundLine(code: ForegroundCode.green, content: 'green'.green),
  singleForegroundLine(code: ForegroundCode.cyan, content: 'cyan'.cyan),
  singleForegroundLine(code: ForegroundCode.blue, content: 'blue'.blue),
  singleForegroundLine(
    code: ForegroundCode.magenta,
    content: 'magenta'.magenta,
  ),
  singleForegroundLine(
    code: ForegroundCode.white,
    content: 'white'.white,
    comment: 'white, sometimes light gray',
  ),
  singleForegroundLine(
    code: HiForegroundCode.black,
    content: 'hi black'.hiBlack,
    comment: 'hi black',
  ),
  singleForegroundLine(code: HiForegroundCode.red, content: 'hi red'.hiRed),
  singleForegroundLine(
    code: HiForegroundCode.yellow,
    content: 'hi yellow'.hiYellow,
  ),
  singleForegroundLine(
    code: HiForegroundCode.green,
    content: 'hi green'.hiGreen,
  ),
  singleForegroundLine(
    code: HiForegroundCode.cyan,
    content: 'hi cyan'.hiCyan,
  ),
  singleForegroundLine(
    code: HiForegroundCode.blue,
    content: 'hi blue'.hiBlue,
  ),
  singleForegroundLine(
    code: HiForegroundCode.magenta,
    content: 'hi magenta'.hiMagenta,
  ),
  singleForegroundLine(
    code: HiForegroundCode.white,
    content: 'hi white'.hiWhite,
    comment: 'hi white',
  ),
];

final singleBackgroundLines = [
  singleBackgroundLine(
    code: BackgroundCode.black,
    content: 'black'.bgBlack,
    comment: 'black',
  ),
  singleBackgroundLine(code: BackgroundCode.red, content: 'red'.bgRed),
  singleBackgroundLine(
    code: BackgroundCode.yellow,
    content: 'yellow'.bgYellow,
  ),
  singleBackgroundLine(code: BackgroundCode.green, content: 'green'.bgGreen),
  singleBackgroundLine(code: BackgroundCode.cyan, content: 'cyan'.bgCyan),
  singleBackgroundLine(code: BackgroundCode.blue, content: 'blue'.bgBlue),
  singleBackgroundLine(
    code: BackgroundCode.magenta,
    content: 'magenta'.bgMagenta,
  ),
  singleBackgroundLine(
    code: BackgroundCode.white,
    content: 'white'.bgWhite,
    comment: 'white',
  ),
  singleBackgroundLine(
    code: HiBackgroundCode.black,
    content: 'hi black'.bgHiBlack,
    comment: 'hi black',
  ),
  singleBackgroundLine(code: HiBackgroundCode.red, content: 'hi red'.bgHiRed),
  singleBackgroundLine(
    code: HiBackgroundCode.yellow,
    content: 'hi yellow'.bgHiYellow,
  ),
  singleBackgroundLine(
    code: HiBackgroundCode.green,
    content: 'hi green'.bgHiGreen,
  ),
  singleBackgroundLine(
    code: HiBackgroundCode.cyan,
    content: 'hi cyan'.bgHiCyan,
  ),
  singleBackgroundLine(
    code: HiBackgroundCode.blue,
    content: 'hi blue'.bgHiBlue,
  ),
  singleBackgroundLine(
    code: HiBackgroundCode.magenta,
    content: 'hi magenta'.bgHiMagenta,
  ),
  singleBackgroundLine(
    code: HiBackgroundCode.white,
    content: 'hi white'.bgHiWhite,
    comment: 'hi white',
  ),
];

String singleForegroundLine({
  required int code,
  required String content,
  String? comment,
}) {
  return [
    '($code:${CancelCode.foreground})',
    '$content color',
    if (comment != null) '($comment)'
  ].join(' ');
}

String singleBackgroundLine({
  required int code,
  required String content,
  String? comment,
}) {
  return [
    '($code:${CancelCode.background})',
    '$content background',
    if (comment != null) '($comment)'
  ].join(' ');
}

String complexForegroundLine() {
  final red = 'red'.foregroundRed;
  final yellow = 'yellow $red yellow'.foregroundYellow;
  final green = 'green $yellow green'.foregroundGreen;
  final cyan = 'cyan $green cyan'.foregroundCyan;
  final blue = 'blue $cyan blue'.foregroundBlue;
  final magenta = 'magenta $blue magenta'.foregroundMagenta;
  return 'complex $magenta line';
}

String complexBackgroundLine() {
  final red = 'red'.backgroundRed;
  final yellow = 'yellow $red yellow'.backgroundYellow;
  final green = 'green $yellow green'.backgroundGreen;
  final cyan = 'cyan $green cyan'.backgroundCyan;
  final blue = 'blue $cyan blue'.backgroundBlue;
  final magenta = 'magenta $blue magenta'.backgroundMagenta;
  return 'complex $magenta background line';
}
