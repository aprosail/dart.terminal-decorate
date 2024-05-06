import 'package:terminal_decorate/terminal_decorate.dart';

void colorExample() {
  for (final line in singleForegroundLines) print(line);
  for (final line in singleBackgroundLines) print(line);
  print(complexForegroundLine());
  print(complexBackgroundLine());
}

final singleForegroundLines = [
  singleForegroundLine(
    code: Escape.foregroundBlack,
    content: 'black'.black,
    comment: 'black, sometimes dark gray',
  ),
  singleForegroundLine(code: Escape.foregroundRed, content: 'red'.red),
  singleForegroundLine(code: Escape.foregroundYellow, content: 'yellow'.yellow),
  singleForegroundLine(code: Escape.foregroundGreen, content: 'green'.green),
  singleForegroundLine(code: Escape.foregroundCyan, content: 'cyan'.cyan),
  singleForegroundLine(code: Escape.foregroundBlue, content: 'blue'.blue),
  singleForegroundLine(
    code: Escape.foregroundMagenta,
    content: 'magenta'.magenta,
  ),
  singleForegroundLine(
    code: Escape.foregroundWhite,
    content: 'white'.white,
    comment: 'white, sometimes light gray',
  ),
  singleForegroundLine(
    code: Escape.foregroundHiBlack,
    content: 'hi black'.hiBlack,
    comment: 'hi black',
  ),
  singleForegroundLine(code: Escape.foregroundHiRed, content: 'hi red'.hiRed),
  singleForegroundLine(
    code: Escape.foregroundHiYellow,
    content: 'hi yellow'.hiYellow,
  ),
  singleForegroundLine(
    code: Escape.foregroundHiGreen,
    content: 'hi green'.hiGreen,
  ),
  singleForegroundLine(
    code: Escape.foregroundHiCyan,
    content: 'hi cyan'.hiCyan,
  ),
  singleForegroundLine(
    code: Escape.foregroundHiBlue,
    content: 'hi blue'.hiBlue,
  ),
  singleForegroundLine(
    code: Escape.foregroundHiMagenta,
    content: 'hi magenta'.hiMagenta,
  ),
  singleForegroundLine(
    code: Escape.foregroundHiWhite,
    content: 'hi white'.hiWhite,
    comment: 'hi white',
  ),
];

final singleBackgroundLines = [
  singleBackgroundLine(
    code: Escape.backgroundBlack,
    content: 'black'.bgBlack,
    comment: 'black',
  ),
  singleBackgroundLine(code: Escape.backgroundRed, content: 'red'.bgRed),
  singleBackgroundLine(
    code: Escape.backgroundYellow,
    content: 'yellow'.bgYellow,
  ),
  singleBackgroundLine(code: Escape.backgroundGreen, content: 'green'.bgGreen),
  singleBackgroundLine(code: Escape.backgroundCyan, content: 'cyan'.bgCyan),
  singleBackgroundLine(code: Escape.backgroundBlue, content: 'blue'.bgBlue),
  singleBackgroundLine(
    code: Escape.backgroundMagenta,
    content: 'magenta'.bgMagenta,
  ),
  singleBackgroundLine(
    code: Escape.backgroundWhite,
    content: 'white'.bgWhite,
    comment: 'white',
  ),
  singleBackgroundLine(
    code: Escape.backgroundHiBlack,
    content: 'hi black'.bgHiBlack,
    comment: 'hi black',
  ),
  singleBackgroundLine(code: Escape.backgroundHiRed, content: 'hi red'.bgHiRed),
  singleBackgroundLine(
    code: Escape.backgroundHiYellow,
    content: 'hi yellow'.bgHiYellow,
  ),
  singleBackgroundLine(
    code: Escape.backgroundHiGreen,
    content: 'hi green'.bgHiGreen,
  ),
  singleBackgroundLine(
    code: Escape.backgroundHiCyan,
    content: 'hi cyan'.bgHiCyan,
  ),
  singleBackgroundLine(
    code: Escape.backgroundHiBlue,
    content: 'hi blue'.bgHiBlue,
  ),
  singleBackgroundLine(
    code: Escape.backgroundHiMagenta,
    content: 'hi magenta'.bgHiMagenta,
  ),
  singleBackgroundLine(
    code: Escape.backgroundHiWhite,
    content: 'hi white'.bgHiWhite,
    comment: 'hi white',
  ),
];

String singleForegroundLine({
  required Escape code,
  required String content,
  String? comment,
}) {
  return [
    '(${code.code}:${Escape.cancelForeground.code})',
    '$content color',
    if (comment != null) '($comment)'
  ].join(' ');
}

String singleBackgroundLine({
  required Escape code,
  required String content,
  String? comment,
}) {
  return [
    '(${code.code}:${Escape.cancelBackground.code})',
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
