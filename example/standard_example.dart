import 'package:terminal_decorate/terminal_decorate.dart';

void standardExample() {
  for (final item in fontStyleDecorations) print(item);
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
