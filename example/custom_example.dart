// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:terminal_decorate/src/custom_color.dart';

void main() {
  for (final item in list) print(customColorForeground(item));
  for (final item in list) print(customColorBackground(item));
}

const list = [
  TerminalCodeColor(0),
  TerminalCodeColor(1),
  TerminalCodeColor(2),
  TerminalCodeColor(34),
  TerminalCodeColor(56),
  TerminalCodeColor(78),
  TerminalCodeColor(123),
  TerminalCodeColor(234),
  TerminalCodeColor(255),
  TerminalRGBColor(0x80, 0x40, 0x40),
  TerminalRGBColor(0x23, 0x45, 0x67),
  TerminalRGBColor(0xde, 0xdc, 0xda),
];

String customColorForeground(TerminalCustomColor color) =>
    'foreground color: ${color.toString().foreground(color)}';

String customColorBackground(TerminalCustomColor color) =>
    'background color: ${color.toString().background(color)}';
