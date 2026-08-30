import 'dart:async';

import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:splash_presentation/src/providers_di.br.dart';

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
      // The mark is centred on the *screen*, not on the lockup it heads.
      //
      // That is the whole trick behind the launch handover. The native launch screen can centre
      // an image in its window exactly and cheaply, and nothing else. Centring the mark and the
      // wordmark as a group — which is what this did — put the mark at an offset that depends on
      // the safe-area insets and on the rendered height of two strings, which no storyboard
      // constraint can follow. So the Flutter side moved to the position the native side can
      // hit, rather than the other way round, and the mark now survives the handover without
      // moving a pixel.
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
          children: <Widget>[
            Center(
              child: NineSquareMark.splash(
                cpuColor: theme.markCpuColor,
                outlineColor: theme.markOutlineColor,
                playerColor: theme.markPlayerColor,
              ),
            ),
            // The lockup hangs from the mark's bottom edge rather than sharing a column with it,
            // so its own height — which moves with the type scale and the reader's text size —
            // can never shift the mark.
            Positioned(
              left: 0,
              right: 0,
              top: constraints.maxHeight / 2 + AppSizing.markSplash / 2 + AppSpacing.spacing750,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
                child: _Wordmark(
                  taglineStyle: theme.taglineStyle,
                  wordmarkStyle: theme.wordmarkStyle,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: _dotsBottomInset),
                  child: Center(child: BlinkingDots(color: theme.dotColor)),
                ),
              ),
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
