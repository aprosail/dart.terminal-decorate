import 'package:terminal_decorate/terminal_decorate.dart';
import 'package:test/test.dart';

void main() {
  test('nest conflicts', () {
    final faint = 'faint'.wrapEscape(Escape.faint, Escape.cancelBoldOrFaint);
    expect(
      'bold $faint bold'.resolveNestEscape(
        Escape.bold,
        Escape.cancelBoldOrFaint,
        conflicts: {Escape.faint},
      ),
      '${Escape.bold}bold '
      '${Escape.faint}faint${Escape.cancelBoldOrFaint}'
      '${Escape.bold} bold${Escape.cancelBoldOrFaint}',
    );
  });

  test('nest overrides', () {
    final red = 'red'.wrapEscape(Escape.foregroundRed, Escape.cancelForeground);
    expect(
      'yellow $red yellow'.resolveNestEscape(
        Escape.foregroundYellow,
        Escape.cancelForeground,
        overrides: {Escape.foregroundRed},
      ),
      '${Escape.foregroundYellow}yellow '
      '${Escape.foregroundRed}red'
      '${Escape.foregroundYellow} yellow${Escape.cancelForeground}',
    );
  });
}
