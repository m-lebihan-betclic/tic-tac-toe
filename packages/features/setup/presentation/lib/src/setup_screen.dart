import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:setup_presentation/src/notifiers/setup_form_notifier.br.dart';
import 'package:setup_presentation/src/providers_di.br.dart';
import 'package:setup_presentation/src/theme/setup_theme.br.dart';
import 'package:setup_presentation/src/widgets/nickname_field.dart';

/// §02 — nickname, difficulty and theme, in one non-dismissible sheet over the board.
///
/// It is a feature rather than a widget inside the board because it has two entry points: a cold
/// start, and settings' `Change` row. Two callers, one sheet.
class SetupScreen extends ConsumerWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SetupTheme theme = ref.watch(setupThemeProvider);
    final AppLocalizations l10n = context.l10n;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.handleColor, width: AppSizing.hairline),
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.sheet)),
        color: theme.sheetColor,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.spacing600,
            AppSpacing.spacing700,
            AppSpacing.spacing600,
            AppSpacing.spacing800,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _GrabHandle(color: theme.handleColor),
              const SizedBox(height: AppSpacing.spacing600),
              Text(l10n.setupTitle, style: theme.titleStyle),
              const SizedBox(height: _subtitleGap),
              Text(l10n.setupSubtitle, style: theme.subtitleStyle),
              const SizedBox(height: AppSpacing.spacing550),
              const NicknameField(),
              const _Label(),
              const _DifficultyChips(),
              const _ThemeLabel(),
              const _ThemeChips(),
              const SizedBox(height: AppSpacing.spacing400),
              const _StartButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GrabHandle extends StatelessWidget {
  final Color color;

  const _GrabHandle({required this.color});

  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox(
      height: _handleHeight,
      width: _handleWidth,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_handleHeight),
          color: color,
        ),
      ),
    ),
  );
}

class _Label extends ConsumerWidget {
  const _Label();

  @override
  Widget build(BuildContext context, WidgetRef ref) => _SectionLabel(text: context.l10n.labelDifficulty);
}

class _ThemeLabel extends ConsumerWidget {
  const _ThemeLabel();

  @override
  Widget build(BuildContext context, WidgetRef ref) => _SectionLabel(text: context.l10n.labelTheme);
}

class _SectionLabel extends ConsumerWidget {
  final String text;

  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
    padding: const EdgeInsets.fromLTRB(0, AppSpacing.spacing600, 0, AppSpacing.spacing250),
    child: Text(text, style: ref.watch(setupThemeProvider).labelStyle),
  );
}

class _DifficultyChips extends ConsumerWidget {
  const _DifficultyChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Difficulty selected = ref.watch(setupFormProvider.select((s) => s.difficulty));
    final AppLocalizations l10n = context.l10n;

    return Row(
      spacing: AppSpacing.spacing200,
      children: <Widget>[
        for (final Difficulty difficulty in Difficulty.values)
          Expanded(
            child: AppChip(
              label: switch (difficulty) {
                Difficulty.easy => l10n.difficultyEasy,
                Difficulty.hard => l10n.difficultyHard,
              },
              onPressed: () => ref.read(setupFormProvider.notifier).difficultyChanged(difficulty),
              selected: difficulty == selected,
            ),
          ),
      ],
    );
  }
}

class _ThemeChips extends ConsumerWidget {
  const _ThemeChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme? selected = ref.watch(setupFormProvider.select((s) => s.theme));
    final AppLocalizations l10n = context.l10n;

    return Row(
      spacing: AppSpacing.spacing200,
      children: <Widget>[
        for (final AppTheme theme in AppTheme.ordered)
          Expanded(
            child: AppChip(
              label: switch (theme) {
                AppTheme.dark => l10n.themeDark,
                AppTheme.light => l10n.themeLight,
                AppTheme.matrix => l10n.themeMatrix,
              },
              onPressed: () => ref.read(setupFormProvider.notifier).themeChanged(theme),
              selected: theme == selected,
              // A literal preview: each swatch is that theme's own ground, with the inset that
              // keeps it legible, and matrix carries its phosphor glow.
              swatch: switch (theme) {
                AppTheme.dark => AppPalette.dark().background,
                AppTheme.light => AppPalette.light().background,
                AppTheme.matrix => AppPalette.matrix().background,
              },
              swatchBorder: switch (theme) {
                AppTheme.dark => AppPalette.dark().onSurface.withValues(alpha: _darkSwatchInset),
                AppTheme.light => AppPalette.light().onSurface.withValues(alpha: _lightSwatchInset),
                AppTheme.matrix => AppPalette.matrix().markPlayer,
              },
              swatchGlow: theme == AppTheme.matrix ? AppPalette.matrix().markPlayer : null,
            ),
          ),
      ],
    );
  }
}

class _StartButton extends ConsumerWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool canStart = ref.watch(setupFormProvider.select((s) => s.canStart));

    return AppButton.primary(
      label: context.l10n.setupStart,
      onPressed: canStart ? ref.read(setupFormProvider.notifier).submit : null,
    );
  }
}

const double _handleHeight = 4;
const double _handleWidth = 38;
const double _subtitleGap = 9;
const double _darkSwatchInset = 0.28;
const double _lightSwatchInset = 0.22;
