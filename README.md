# Terminal Decorate

Terminal colorization and text style decoration for Dart:
This package is an encapsulation of the terminal escape code,
refer to the standard: ANSI X3.64, ECMA-48, or ISO 6429.

Thanks to Dart's extension mechanism, you can use it like this:

```dart
// Font style decoration.
print('normal ${'italic ${'bold'.bold} italic'} normal');

// Font color decoration.
print('normal ${'red ${'yellow'.yellow} red'.red} normal');
```
