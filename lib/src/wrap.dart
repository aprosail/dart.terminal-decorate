import 'package:syntax_sugar/syntax_sugar.dart';

import 'escape.dart';

extension WrapTerminalDecorations on String {
  /// Syntax sugar for `$prefix$this$suffix`.
  String wrapEscape(Escape prefix, Escape suffix) => '$prefix$this$suffix';

  /// Resolve when there's nesting escape decorations in this string.
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
  /// 2. An [Escape] cannot exist both in [conflicts] and [overrides],
  ///    which means intersection of [conflicts] and [overrides] must be empty.
  ///    there's only asserts, no exception will be thrown.
  /// 3. Either [conflicts] and [overrides] cannot contain the [prefix].
  ///    there's only asserts, no exception will be thrown.
  /// 4. [conflicts] and [overrides] cannot both be empty.
  ///    In that case, please use [wrapEscape] rather than this method.
  String resolveNestEscape(
    Escape prefix,
    Escape suffix, {
    Set<Escape> conflicts = const {},
    Set<Escape> overrides = const {},
  }) {
    if (conflicts.isEmpty && overrides.isEmpty) {
      return wrapEscape(prefix, suffix);
    }

    assert(!conflicts.contains(prefix), 'conflicts cannot contain prefix');
    assert(!overrides.contains(prefix), 'overrides cannot contain prefix');
    if (overrides.isEmpty) return _resolveNestConflicts(prefix, suffix);
    if (conflicts.isEmpty) return _resolveNestOverrides(prefix, suffix);

    assert(
      conflicts.intersection(overrides).isEmpty,
      '${conflicts.intersection(overrides)} '
      'cannot exist in both conflicts and overrides',
    );
    return matchIndexOf(conflicts) < matchIndexOf(overrides)
        ? _resolveNestConflicts(prefix, suffix)
        : _resolveNestOverrides(prefix, suffix);
  }

  /// 1. Wrap escape prefix/suffix,
  /// 2. Reenable prefix after the last nested suffix of cancel if exist.
  String _resolveNestConflicts(Escape prefix, Escape suffix) {
    final index = matchLastIndexOf(suffix);
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
    final index = matchLastIndexOf(suffix);
    return index == -1
        ? wrapEscape(prefix, suffix)
        : '$prefix${substring(0, index)}'
            '$prefix${substring(index + suffix.length)}$suffix';
  }
}
