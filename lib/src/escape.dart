/// Represent a terminal escape code, like `\x1b[1m` or `\x1b[31m`.
///
/// Such escape code are used to control the terminal output,
/// with witch you can change the color, font, and even play animations.
/// The code is specified in standards including
/// `ANSI X3.64`, `ECMA-48`, or `ISO 6429`.
///
/// The [parameters] are usually not specified (empty),
/// they are usually only specified for customized colors,
/// such color code and RBG color customizations.
///
/// Attention that there's only check whether the [code] is 0~255.
/// There's neither check nor even asserts to make sure ths [code]
/// is supported by this library.
class Escape {
  const Escape(this.code, {this.parameters = const []})
      : assert(code >= 0, 'escape code must be positive: $code'),
        assert(code <= 0xff, 'escape code must be less than 256: $code');

  final int code;
  final List<int> parameters;

  /// Length of the full decoration code string. (`\x1b` is a single character).
  int get length => toString().length;

  @override
  String toString() => parameters.isNotEmpty
      ? '\x1b[$code;${parameters.join(';')}m'
      : '\x1b[${code}m';
}

extension WrapTerminalDecorations on String {
  /// Syntax sugar for `$prefix$this$suffix`.
  String wrapEscape(Escape prefix, Escape suffix) => '$prefix$this$suffix';

  /// Resolve when there's nesting escape decorations in this string.
  ///
  /// The [conflicts] and [overrides] are all [int] codes rather than
  /// [Escape] instances, because the real conflict and override are
  /// about the escape code, and their parameters can be various.
  ///
  /// - [conflicts] means the decorations can exist in the same time,
  ///   but they share the same suffix,
  ///   that the inner suffix will cancel the outer decoration.
  ///   So this method will make sure the outer decoration remains.
  ///   For example: bold/faint and underlines usually uses [conflicts].
  /// - [overrides] means the decorations cannot exist in the same time,
  ///   enabling one decoration will cancel the others.
  ///   For example: colors usually uses [overrides].
  ///
  /// Resolve when there might be conflicts or overrides
  /// with the prefix in this string.
  /// It will ensure this decoration will not be disturbed by
  /// different inner decorations.
  /// And the string will be as minimal as possible.
  ///
  /// ## Attentions
  ///
  /// This method is not designed for compatibilities or direct call.
  /// It respect performance first. So the following rules must be followed:
  ///
  /// 1. Make sure any of the [conflicts] and [overrides]
  ///    will use the same [suffix] as this [prefix].
  /// 2. An escape code cannot exist both in [conflicts] and [overrides],
  ///    which means intersection of [conflicts] and [overrides] must be empty.
  ///    there's only asserts, no exception will be thrown.
  /// 3. Either [conflicts] and [overrides] cannot contain the [prefix].
  ///    there's only asserts, no exception will be thrown.
  /// 4. [conflicts] and [overrides] cannot both be empty.
  ///    In that case, please use [wrapEscape] rather than this method.
  String resolveNestEscape(
    Escape prefix,
    Escape suffix, {
    Set<int> conflicts = const {},
    Set<int> overrides = const {},
  }) {
    if (conflicts.isEmpty && overrides.isEmpty) {
      return wrapEscape(prefix, suffix);
    }

    assert(!conflicts.contains(prefix.code), 'conflicts cannot contain prefix');
    assert(!overrides.contains(prefix.code), 'overrides cannot contain prefix');
    if (overrides.isEmpty) return _resolveNestConflicts(prefix, suffix);
    if (conflicts.isEmpty) return _resolveNestOverrides(prefix, suffix);

    assert(
      conflicts.intersection(overrides).isEmpty,
      '${conflicts.intersection(overrides)} '
      'cannot exist in both conflicts and overrides',
    );
    final conflictRegexp = RegExp('\x1b\\\\[(${conflicts.join('|')})m');
    final overrideRegexp = RegExp('\x1b\\\\[(${overrides.join('|')})m');

    return indexOf(conflictRegexp) < indexOf(overrideRegexp)
        ? _resolveNestConflicts(prefix, suffix)
        : _resolveNestOverrides(prefix, suffix);
  }

  /// 1. Wrap escape prefix/suffix,
  /// 2. Reenable prefix after the last nested suffix of cancel if exist.
  String _resolveNestConflicts(Escape prefix, Escape suffix) {
    final index = lastIndexOf(suffix.toString());
    if (index == -1) return wrapEscape(prefix, suffix);
    final position = index + suffix.length;
    return '$prefix${substring(0, position)}'
        '$prefix${substring(position)}$suffix';
  }

  /// 1. Wrap escape prefix/suffix,
  /// 2. Reenable prefix after the last nested suffix of cancel if exist.
  /// 3. Remove unnecessary cancel because the prefix will override
  ///    inner decoration's prefix escape code.
  String _resolveNestOverrides(Escape prefix, Escape suffix) {
    final index = lastIndexOf(suffix.toString());
    return index == -1
        ? wrapEscape(prefix, suffix)
        : '$prefix${substring(0, index)}'
            '$prefix${substring(index + suffix.length)}$suffix';
  }
}

extension CancelCode on int {
  static const all = 0;
  static const boldOrFaint = 22;
  static const italic = 23;
  static const underline = 24;
  static const blink = 25;
  static const negative = 27;
  static const conceal = 28;
  static const strikethrough = 29;
  static const foreground = 39;
  static const background = 49;
}

extension FontStyleCode on int {
  static const bold = 1;
  static const faint = 2;
  static const italic = 3;
  static const underline = 4;
  static const blink = 5;
  static const blinkRapid = 6;
  static const negative = 7;
  static const conceal = 8;
  static const strikethrough = 9;
  static const doubleUnderline = 21;
}

extension ForegroundCode on int {
  static const black = 30;
  static const red = 31;
  static const green = 32;
  static const yellow = 33;
  static const blue = 34;
  static const magenta = 35;
  static const cyan = 36;
  static const white = 37;
  static const custom = 38;

  /// Attention that this set is unchangeable(const)!
  ///
  /// Only 8 color code values, the [custom] code is not included,
  /// and all hi(highlight) color code values are not included.
  ///
  /// 1. If you'd like to include [custom], consider using [valuesAndCustom].
  /// 2. If you'd like to include hi(highlight) color code values,
  ///    consider using [all].
  static const values = {black, red, green, yellow, blue, magenta, cyan, white};

  /// Attention that this set is unchangeable(const)!
  ///
  /// All color code values, including [custom] and hi(highlight) color codes.
  /// But the [custom] is still not included.
  /// If you'd like to include [custom], consider using [allAndCustom].
  static const all = {...values, ...HiForegroundCode.values};

  /// Attention that this set is unchangeable(const)!
  static const allAndCustom = {...all, custom};

  /// Attention that this set is unchangeable(const)!
  static const valuesAndCustom = {...values, custom};
}

extension BackgroundCode on int {
  static const black = 40;
  static const red = 41;
  static const green = 42;
  static const yellow = 43;
  static const blue = 44;
  static const magenta = 45;
  static const cyan = 46;
  static const white = 47;
  static const custom = 48;

  /// Attention that this set is unchangeable(const)!
  ///
  /// Only 8 color code values, the [custom] code is not included,
  /// and all hi(highlight) color code values are not included.
  ///
  /// 1. If you'd like to include [custom], consider using [valuesAndCustom].
  /// 2. If you'd like to include hi(highlight) color code values,
  ///    consider using [all].
  static const values = {black, red, green, yellow, blue, magenta, cyan, white};

  /// Attention that this set is unchangeable(const)!
  ///
  /// All color code values, including [custom] and hi(highlight) color codes.
  /// But the [custom] is still not included.
  /// If you'd like to include [custom], consider using [allAndCustom].
  static const all = {...values, ...HiForegroundCode.values};

  /// Attention that this set is unchangeable(const)!
  static const allAndCustom = {...all, custom};

  /// Attention that this set is unchangeable(const)!
  static const valuesAndCustom = {...values, custom};
}

extension HiForegroundCode on int {
  static const black = 90;
  static const red = 91;
  static const green = 92;
  static const yellow = 93;
  static const blue = 94;
  static const magenta = 95;
  static const cyan = 96;
  static const white = 97;

  static const values = {black, red, green, yellow, blue, magenta, cyan, white};
}

extension HiBackgroundCode on int {
  static const black = 100;
  static const red = 101;
  static const green = 102;
  static const yellow = 103;
  static const blue = 104;
  static const magenta = 105;
  static const cyan = 106;
  static const white = 107;

  static const values = {black, red, green, yellow, blue, magenta, cyan, white};
}
