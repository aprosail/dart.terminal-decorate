import 'package:terminal_decorate/terminal_decorate.dart';
import 'package:test/test.dart';

void main() => nestTest();

void nestTest() {
  group('nest color', () {
    test('nest color foreground', () {
      final red = 'red'.red;
      final yellow = 'yellow $red yellow'.yellow;
      final blue = 'blue $yellow blue'.blue;
      final normal = 'normal $blue normal';

      expect(
        normal,
        'normal '
        '${Escape.foregroundBlue}blue '
        '${Escape.foregroundYellow}yellow '
        '${Escape.foregroundRed}red${Escape.cancelForeground}'
        '${Escape.foregroundYellow} yellow${Escape.cancelForeground}'
        '${Escape.foregroundBlue} blue${Escape.cancelForeground}'
        ' normal',
      );
    });

    test('nest color background', () {
      final red = 'red'.bgRed;
      final yellow = 'yellow $red yellow'.bgYellow;
      final blue = 'blue $yellow blue'.bgBlue;
      final normal = 'normal $blue normal';

      expect(
        normal,
        'normal '
        '${Escape.backgroundBlue}blue '
        '${Escape.backgroundYellow}yellow '
        '${Escape.backgroundRed}red${Escape.cancelBackground}'
        '${Escape.backgroundYellow} yellow${Escape.cancelBackground}'
        '${Escape.backgroundBlue} blue${Escape.cancelBackground}'
        ' normal',
      );
    });
  });
}
