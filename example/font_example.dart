// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:terminal_decorate/terminal_decorate.dart';

void main() => fontExample();

void fontExample() {
  for (final line in basicFontDecorations) print(line);
  print(mixBoldAndFaint());
  print(mixBlinks());
  print(mixUnderlines());
}

final basicFontDecorations = [
  singleFontLine(
    prefix: Escape.bold,
    suffix: Escape.cancelBoldOrFaint,
    content: 'bold'.bold,
  ),
  singleFontLine(
    prefix: Escape.faint,
    suffix: Escape.cancelBoldOrFaint,
    content: 'faint/dim'.faint,
  ),
  singleFontLine(
    prefix: Escape.italic,
    suffix: Escape.cancelItalic,
    content: 'italic'.italic,
  ),
  singleFontLine(
    prefix: Escape.underline,
    suffix: Escape.cancelUnderline,
    content: 'underline'.underline,
  ),
  singleFontLine(
    prefix: Escape.blink,
    suffix: Escape.cancelBlink,
    content: 'blink'.blink,
    comment: 'usually unsupported',
  ),
  singleFontLine(
    prefix: Escape.rapidBlink,
    suffix: Escape.cancelBlink,
    content: 'rapid blink'.rapidBlink,
    comment: 'usually unsupported',
  ),
  singleFontLine(
    prefix: Escape.negative,
    suffix: Escape.cancelNegative,
    content: 'negative'.negative,
  ),
  singleFontLine(
    prefix: Escape.conceal,
    suffix: Escape.cancelConceal,
    content: 'conceal/hide'.conceal,
    comment: 'conceal/hide',
  ),
  singleFontLine(
    prefix: Escape.crossLine,
    suffix: Escape.cancelCrossLine,
    content: 'cross line'.crossLine,
  ),
  singleFontLine(
    prefix: Escape.doubleUnderline,
    suffix: Escape.cancelUnderline,
    content: 'double underline'.doubleUnderline,
    comment: 'usually unsupported',
  ),
];

String singleFontLine({
  required Escape prefix,
  required Escape suffix,
  required String content,
  String? comment,
}) {
  return '(${prefix.code}:${suffix.code}) $content style '
      '${comment != null ? '($comment)' : ''}';
}

String mixBoldAndFaint() {
  final bold = 'bold'.bold;
  final faint = 'faint $bold faint'.faint;
  return 'normal $faint normal';
}

String mixBlinks() {
  final rapidBlink = 'rapid blink'.blink;
  final blink = 'blink $rapidBlink blink'.blink;
  return 'normal $blink normal (usually unsupported)';
}

String mixUnderlines() {
  final doubleUnderline = 'double underline'.doubleUnderline;
  final underline = 'underline $doubleUnderline underline'.underline;
  return 'normal $underline normal (usually unsupported)';
}
