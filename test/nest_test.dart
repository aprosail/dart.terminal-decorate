import 'package:terminal_decorate/terminal_decorate.dart';
import 'package:test/test.dart';

void main() {
  test('nest conflicts', () {
    expect(
      'bold ${'faint'.faint} bold'.bold,
      '${Escape(FontStyleCode.bold)}bold '
      '${Escape(FontStyleCode.faint)}faint${Escape(CancelCode.boldOrFaint)}'
      '${Escape(FontStyleCode.bold)} bold${Escape(CancelCode.boldOrFaint)}',
    );
  });

  test('nest overrides', () {
    expect(
      'yellow ${'red'.red} yellow'.yellow,
      '${Escape(ForegroundCode.yellow)}yellow '
      '${Escape(ForegroundCode.red)}red'
      '${Escape(ForegroundCode.yellow)} yellow${Escape(CancelCode.foreground)}',
    );
  });
}
