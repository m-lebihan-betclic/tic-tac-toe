import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:settings_presentation/src/providers_di.br.dart';
import 'package:settings_presentation/src/theme/settings_theme.br.dart';
import 'package:settings_presentation/src/widgets/close_glyph.dart';
import 'package:settings_presentation/src/widgets/nickname_row.dart';

/// §07 — the player, the level, the theme and the language, each a caption over one grouped card.
///
/// There is no form and no submit: every control writes straight through to the session, which is
/// what makes a theme tap repaint the app under the finger. Nothing here interrupts a round —
/// the board's state lives in a provider, not in this route's subtree.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color backgroundColor = ref.watch(settingsThemeProvider.select((t) => t.backgroundColor));

    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _Gutter(child: _Header()),
            SizedBox(height: _headerGap),
            // The sections scroll and the footer does not: the footer is a statement about the
            // screen, so it stays put, and the sections have to survive a long nickname, two
            // French labels and whatever Dynamic Type the reader has set.
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: AppSpacing.spacing700),
                child: _Gutter(child: _Sections()),
              ),
            ),
            _Gutter(child: _Footer()),
            SizedBox(height: AppSpacing.spacing800),
          ],
        ),
      ),
    );
  }
}

class _Gutter extends StatelessWidget {
  final Widget child;

  const _Gutter({required this.child});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
    child: child,
  );
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SettingsTheme theme = ref.watch(settingsThemeProvider);
    final AppLocalizations l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(top: _headerTop),
      child: Row(
        spacing: _headerGlyphGap,
        children: <Widget>[
          AppIconButton(
            glyph: CloseGlyph(color: theme.closeGlyphColor),
            onPressed: ref.watch(settingsRoutingProvider).onDismissSettings,
            semanticLabel: l10n.settingsTitle,
          ),
          Expanded(child: Text(l10n.settingsTitle, style: theme.titleStyle)),
        ],
      ),
    );
  }
}

class _Sections extends StatelessWidget {
  const _Sections();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: AppSpacing.spacing700,
    children: <Widget>[
      _PlayerSection(),
      _DifficultySection(),
      _ThemeSection(),
      _LanguageSection(),
    ],
  );
}

/// A caption over its card. A class rather than a helper function, so each section keeps its own
/// rebuild boundary and the label above it is `const`.
class _Section extends ConsumerWidget {
  final Widget child;
  final String label;

  const _Section({required this.child, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: AppSpacing.spacing300,
    children: <Widget>[
      Text(label, style: ref.watch(settingsThemeProvider.select((t) => t.labelStyle))),
      child,
    ],
  );
}

/// Edited in place rather than by reopening the setup sheet. A sheet to change one twelve-
/// character string is a whole screen's worth of ceremony for a field that is already on the one
/// the player is looking at.
class _PlayerSection extends ConsumerWidget {
  const _PlayerSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) => _Section(
    label: context.l10n.labelPlayer,
    child: const AppCard(children: <Widget>[NicknameRow()]),
  );
}

/// The level, and the sentence that says when it takes effect.
///
/// The write lands immediately; the *round* is what waits. A round carries the level it started
/// with, so switching here cannot rescue a game that is one move from lost.
class _DifficultySection extends ConsumerWidget {
  const _DifficultySection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.l10n;
    // The only fallback the screen resolves itself, because the domain states it: an unset level
    // *is* `Difficulty.initial`, which is a rule rather than a platform fact.
    final Difficulty selected = ref.watch(storedDifficultyProvider) ?? Difficulty.initial;

    return _Section(
      label: l10n.labelDifficulty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.spacing250,
        children: <Widget>[
          AppSegmentedControl<Difficulty>(
            onSelected: ref.watch(saveDifficultyProvider),
            segments: <AppSegment<Difficulty>>[
              for (final Difficulty difficulty in Difficulty.values)
                AppSegment<Difficulty>(
                  label: switch (difficulty) {
                    Difficulty.easy => l10n.difficultyEasy,
                    Difficulty.hard => l10n.difficultyHard,
                  },
                  value: difficulty,
                ),
            ],
            selected: selected,
          ),
          Text(
            l10n.difficultyNote,
            style: ref.watch(settingsThemeProvider.select((t) => t.noteStyle)),
          ),
        ],
      ),
    );
  }
}

/// Three rows, no System row — the setup sheet offers the same three, and a fourth option here
/// would mean the two screens disagreed about what the choices are. The selected row is the theme
/// in force, which on a cold start is the platform's own rather than nothing at all.
class _ThemeSection extends ConsumerWidget {
  const _ThemeSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.l10n;
    final AppTheme selected = ref.watch(activeThemeProvider);
    final SaveThemeFun save = ref.watch(saveThemeProvider);

    return _Section(
      label: l10n.labelTheme,
      child: AppCard(
        children: <Widget>[
          for (final AppTheme theme in AppTheme.ordered)
            AppCardRow(
              emphasized: theme == selected,
              label: switch (theme) {
                AppTheme.dark => l10n.themeDark,
                AppTheme.light => l10n.themeLight,
                AppTheme.matrix => l10n.themeMatrix,
              },
              onPressed: () => save(theme),
              trailing: AppRadio(selected: theme == selected),
            ),
        ],
      ),
    );
  }
}

/// The language follows the device until somebody picks one here — so the selection is read from
/// what is in force, not from what is stored, and the control is never drawn with neither half
/// filled.
class _LanguageSection extends ConsumerWidget {
  const _LanguageSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.l10n;

    return _Section(
      label: l10n.labelLanguage,
      child: AppSegmentedControl<AppLocale>(
        onSelected: ref.watch(saveLocaleProvider),
        segments: <AppSegment<AppLocale>>[
          for (final AppLocale locale in AppLocale.values)
            AppSegment<AppLocale>(
              label: switch (locale) {
                AppLocale.en => l10n.languageEnglish,
                AppLocale.fr => l10n.languageFrench,
              },
              value: locale,
            ),
        ],
        selected: ref.watch(activeLocaleProvider),
      ),
    );
  }
}

/// The rule, then the build. Two lines rather than one sentence with a number wedged into it: the
/// sentence is about behaviour and the version is about this binary, and only one of them is worth
/// reading twice.
class _Footer extends ConsumerWidget {
  const _Footer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.l10n;
    final TextStyle noteStyle = ref.watch(settingsThemeProvider.select((t) => t.noteStyle));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.spacing250,
      children: <Widget>[
        Text(l10n.settingsFooter, style: noteStyle),
        // Centred, and centred on the screen rather than on the sentence above it: the gutter is
        // symmetric, so stretching and centring the text lands it on the page's own axis.
        Text(
          l10n.settingsVersion(ref.watch(versionProvider)),
          style: noteStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

const double _headerGap = AppSpacing.spacing800;
const double _headerGlyphGap = 14;
const double _headerTop = AppSpacing.spacing550;
