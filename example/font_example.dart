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
    prefix: FontStyleCode.bold,
    suffix: CancelCode.boldOrFaint,
    content: 'bold'.bold,
  ),
  singleFontLine(
    prefix: FontStyleCode.faint,
    suffix: CancelCode.boldOrFaint,
    content: 'faint/dim'.faint,
  ),
  singleFontLine(
    prefix: FontStyleCode.italic,
    suffix: CancelCode.italic,
    content: 'italic'.italic,
  ),
  singleFontLine(
    prefix: FontStyleCode.underline,
    suffix: CancelCode.underline,
    content: 'underline'.underline,
  ),
  singleFontLine(
    prefix: FontStyleCode.blink,
    suffix: CancelCode.blink,
    content: 'blink'.blink,
    comment: 'usually unsupported',
  ),
  singleFontLine(
    prefix: FontStyleCode.blinkRapid,
    suffix: CancelCode.blink,
    content: 'rapid blink'.blinkRapid,
    comment: 'usually unsupported',
  ),
  singleFontLine(
    prefix: FontStyleCode.negative,
    suffix: CancelCode.negative,
    content: 'negative'.negative,
  ),
  singleFontLine(
    prefix: FontStyleCode.conceal,
    suffix: CancelCode.conceal,
    content: 'conceal/hide'.conceal,
    comment: 'conceal/hide',
  ),
  singleFontLine(
    prefix: FontStyleCode.strikethrough,
    suffix: CancelCode.strikethrough,
    content: 'strikethrough/delete/line-through'.strikethrough,
  ),
  singleFontLine(
    prefix: FontStyleCode.doubleUnderline,
    suffix: CancelCode.underline,
    content: 'double underline'.doubleUnderline,
    comment: 'usually unsupported or thick line',
  ),
];

String singleFontLine({
  required int prefix,
  required int suffix,
  required String content,
  String? comment,
}) {
  return '($prefix:$suffix) $content style '
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
