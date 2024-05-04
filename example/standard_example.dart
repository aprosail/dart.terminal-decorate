import 'package:terminal_decorate/terminal_decorate.dart';

void standardExample() {
  for (final item in fontStyleDecorations) print(item);
  for (final item in foregroundDecorations) print(item);
  for (final item in backgroundDecorations) print(item);
}

final fontStyleDecorations = [
  '\nfont style decorations:',
  '(${Escape.bold.code}:${Escape.cancelBoldOrFaint.code}) ${'bold'.bold} style',
  '(${Escape.faint.code}:${Escape.cancelBoldOrFaint.code}) '
      '${'faint/dim'.faint} style',
  '(${Escape.italic.code}:${Escape.cancelItalic.code}) '
      '${'italic'.italic} style',
  '(${Escape.underline.code}:${Escape.cancelUnderline.code}) '
      '${'underline'.underline} style',
  '(${Escape.blink.code}:${Escape.cancelBlink.code}) '
      '${'blink'.blink} style '
      '(usually unsupported)',
  '(${Escape.rapidBlink.code}:${Escape.cancelBlink.code}) '
      '${'rapid blink'.rapidBlink} style '
      '(usually unsupported)',
  '(${Escape.negative.code}:${Escape.cancelNegative.code}) '
      '${'negative'.negative} style',
  '(${Escape.conceal.code}:${Escape.cancelConceal.code}) '
      '${'conceal'.conceal} (conceal/hide) style',
  '(${Escape.crossLine.code}:${Escape.cancelCrossLine.code}) '
      '${'cross line'.crossLine} style',
  '(${Escape.doubleUnderline.code}:${Escape.cancelUnderline.code}) '
      '${'double underline'.doubleUnderline} style '
      '(usually unsupported)',
];

final foregroundDecorations = [
  '(${Escape.black.code}:${Escape.cancelFg.code}) '
      '${'black'.black} (black) style (sometimes deep gray)',
  '(${Escape.red.code}:${Escape.cancelFg.code}) ${'red'.red} style',
  '(${Escape.yellow.code}:${Escape.cancelFg.code}) ${'yellow'.yellow} style',
  '(${Escape.green.code}:${Escape.cancelFg.code}) ${'green'.green} style',
  '(${Escape.cyan.code}:${Escape.cancelFg.code}) ${'cyan'.cyan} style',
  '(${Escape.blue.code}:${Escape.cancelFg.code}) ${'blue'.blue} style',
  '(${Escape.magenta.code}:${Escape.cancelFg.code}) ${'magenta'.magenta} style',
  '(${Escape.white.code}:${Escape.cancelFg.code}) '
      '${'white'.white} (white) style',
];

final backgroundDecorations = [
  '(${Escape.bgBlack.code}:${Escape.cancelBg.code}) '
      '${'black background'.bgBlack} (black) style',
  '(${Escape.bgRed.code}:${Escape.cancelBg.code}) '
      '${'red background'.bgRed} style',
  '(${Escape.bgYellow.code}:${Escape.cancelBg.code}) '
      '${'yellow background'.bgYellow} style',
  '(${Escape.bgGreen.code}:${Escape.cancelBg.code}) '
      '${'green background'.bgGreen} style',
  '(${Escape.bgCyan.code}:${Escape.cancelBg.code}) '
      '${'cyan background'.bgCyan} style',
  '(${Escape.bgBlue.code}:${Escape.cancelBg.code}) '
      '${'blue background'.bgBlue} style',
  '(${Escape.bgMagenta.code}:${Escape.cancelBg.code}) '
      '${'magenta background'.bgMagenta} style',
  '(${Escape.bgWhite.code}:${Escape.cancelBg.code}) '
      '${'white background'.bgWhite} (white) style',
];
