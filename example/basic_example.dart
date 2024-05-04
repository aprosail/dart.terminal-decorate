import 'package:terminal_decorate/terminal_decorate.dart';

void main() {
  for (final item in fontStyleDecorations) print(item);
}

final fontStyleDecorations = [
  '\nfont style decorations:',
  '(${Escape.bold.code}:${Escape.cancelBoldOrFaint}) ${'bold'.bold} style',
  '(${Escape.faint.code}:${Escape.cancelBoldOrFaint}) ${'faint'.faint} style',
  '(${Escape.italic.code}:${Escape.cancelItalic}) ${'italic'.italic} style',
  '(${Escape.underline.code}:${Escape.cancelUnderline}) '
      '${'underline'.underline} style',
  '(${Escape.blink.code}:${Escape.cancelBlink}) '
      '${'blink'.blink} style '
      '(usually unsupported)',
  '(${Escape.rapidBlink.code}:${Escape.cancelBlink}) '
      '${'rapid blink'.rapidBlink} style '
      '(usually unsupported)',
  '(${Escape.negative.code}:${Escape.cancelNegative}) '
      '${'negative'.negative} style',
  '(${Escape.conceal.code}:${Escape.cancelConceal}) ${'conceal'.conceal} style',
  '(${Escape.crossLine.code}:${Escape.cancelCrossLine}) '
      '${'cross line'.crossLine} style',
];
