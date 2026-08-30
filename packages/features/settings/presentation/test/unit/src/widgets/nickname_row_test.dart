import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;
import 'package:settings_presentation/settings_presentation.dart' as settings_presentation;
import 'package:settings_presentation/src/widgets/nickname_row.dart';

/// Records what was written, so a test can assert that nothing was — which is half of what this
/// row promises.
final class _RecordingPlayerRepository implements PlayerRepository {
  final Player initial;
  final List<Player> written = <Player>[];

  _RecordingPlayerRepository(this.initial);

  @override
  Player? read() => written.isEmpty ? initial : written.last;

  @override
  void write(Player player) => written.add(player);
}

final class _NoopRouting implements settings_presentation.SettingsRouting {
  const _NoopRouting();

  @override
  void onDismissSettings() {}
}

Player _player(String name) => Player.create(name).getOrThrow();

Future<void> _pumpRow(WidgetTester tester, _RecordingPlayerRepository repository) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: <Override>[
        ...design_providers.bindProviders(
          palette: Provider<AppPalette>((ref) => AppPalette.light()),
          typography: Provider<AppTypography>((ref) => AppTypography.system()),
        ),
        ...session_domain.bindProviders(
          player: Provider<PlayerRepository>((ref) => repository),
        ),
        ...settings_presentation.bindProviders(
          locale: Provider<AppLocale>((ref) => AppLocale.en),
          player: Provider<Player>((ref) => repository.initial),
          routing: (ref) => const _NoopRouting(),
          theme: Provider<AppTheme>((ref) => AppTheme.light),
          version: Provider<String>((ref) => '1.0.0'),
        ),
      ],
      child: MaterialApp(
        home: const Scaffold(body: NicknameRow()),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          extensions: <ThemeExtension<dynamic>>[AppPalette.light(), AppTypography.system()],
          useMaterial3: true,
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('the return key saves the new nickname', (tester) async {
    final _RecordingPlayerRepository repository = _RecordingPlayerRepository(_player('Morgan'));
    await _pumpRow(tester, repository);

    await tester.enterText(find.byType(TextField), 'Ada');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(repository.written, <Player>[_player('Ada')]);
  });

  testWidgets('losing focus without the return key changes nothing, on screen or in the session', (
    tester,
  ) async {
    final _RecordingPlayerRepository repository = _RecordingPlayerRepository(_player('Morgan'));
    await _pumpRow(tester, repository);

    await tester.enterText(find.byType(TextField), 'Ada');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump();

    expect(repository.written, isEmpty);
    // The field goes back too, or the row would show a name the session does not hold.
    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text, 'Morgan');
  });

  testWidgets('a nickname that is only whitespace is a change that was never made', (tester) async {
    final _RecordingPlayerRepository repository = _RecordingPlayerRepository(_player('Morgan'));
    await _pumpRow(tester, repository);

    await tester.enterText(find.byType(TextField), '   ');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(repository.written, isEmpty);
    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text, 'Morgan');
  });

  testWidgets('the domain trims, and the row shows what was stored rather than what was typed', (
    tester,
  ) async {
    final _RecordingPlayerRepository repository = _RecordingPlayerRepository(_player('Morgan'));
    await _pumpRow(tester, repository);

    await tester.enterText(find.byType(TextField), '  Ada  ');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(repository.written, <Player>[_player('Ada')]);
    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text, 'Ada');
  });
}
