import 'dart:async';

import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:splash_presentation/src/providers_di.br.dart';
import 'package:splash_presentation/src/widgets/blinking_dots.dart';
import 'package:splash_presentation/src/widgets/splash_mark.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Timer? _hold;

  @override
  void initState() {
    super.initState();
    // The brand beat is a fixed hold, not a loading state: nothing is being fetched. It has to
    // be cancellable all the same, or a dispose mid-hold delivers navigation to a dead route.
    _hold = Timer(AppMotion.splashHold, () {
      if (mounted) ref.read(splashRoutingProvider).onSplashCompleted();
    });
  }

  @override
  void dispose() {
    _hold?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(splashThemeProvider);

    // Scaffold, not a bare ColoredBox: it is what puts a Material in the tree. Without one,
    // every Text merges onto MaterialApp's fallback style and inherits its monospace family and
    // its yellow double underline, because a TextStyle only overrides the fields it sets.
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: AppSpacing.spacing750,
                    children: <Widget>[
                      SplashMark(
                        cpuColor: theme.markCpuColor,
                        outlineColor: theme.markOutlineColor,
                        playerColor: theme.markPlayerColor,
                      ),
                      _Wordmark(
                        taglineStyle: theme.taglineStyle,
                        wordmarkStyle: theme.wordmarkStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: _dotsBottomInset),
              child: BlinkingDots(color: theme.dotColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _Wordmark extends StatelessWidget {
  final TextStyle taglineStyle;
  final TextStyle wordmarkStyle;

  const _Wordmark({required this.taglineStyle, required this.wordmarkStyle});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: _taglineGap,
      children: <Widget>[
        // The wordmark is a lockup: it stays on one line at every width, shrinking to fit rather
        // than wrapping. `scaleDown` only ever shrinks, so the drawn 26px is its maximum.
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(l10n.splashWordmark, maxLines: 1, style: wordmarkStyle),
        ),
        Text(l10n.splashTagline, style: taglineStyle, textAlign: TextAlign.center),
      ],
    );
  }
}

/// Both off the spacing scale, and both drawn against the safe area rather than the screen edge.
const double _dotsBottomInset = 52;
const double _taglineGap = 14;
