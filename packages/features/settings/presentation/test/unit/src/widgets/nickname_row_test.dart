import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;
import 'package:settings_presentation/settings_presentation.dart' as settings_presentation;
import 'package:settings_presentation/src/widgets/nickname_row.dart';
import 'package:shouldly/shouldly.dart';

/// Records what was written, so a scenario can assert that nothing was — which is half of what
/// this row promises.
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

/// The repository is the scenario's subject, so it is built once and read back from the context
/// by the overrides — a second instance would record writes nobody asserts on.
_RecordingPlayerRepository _repositoryOf(TestContext context) =>
    context.namedParameterOf<_RecordingPlayerRepository>(_repositoryKey);

const String _repositoryKey = 'repository';

List<Override> _overrides(TestContext context) => <Override>[
  ...design_providers.bindProviders(
    palette: Provider<AppPalette>((ref) => AppPalette.light()),
    typography: Provider<AppTypography>((ref) => AppTypography.system()),
  ),
  ...session_domain.bindProviders(
    player: Provider<PlayerRepository>((ref) => _repositoryOf(context)),
  ),
  ...settings_presentation.bindProviders(
    locale: Provider<AppLocale>((ref) => AppLocale.en),
    player: Provider<Player>((ref) => _repositoryOf(context).initial),
    routing: (ref) => const _NoopRouting(),
    theme: Provider<AppTheme>((ref) => AppTheme.light),
    version: Provider<String>((ref) => '1.0.0'),
  ),
];

Future<void> _pumpRow(WidgetTester tester, List<Override> providers) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: providers,
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

String _fieldText(WidgetTester tester) => tester.widget<TextField>(find.byType(TextField)).controller?.text ?? '';

void main() {
  givenWidget(
        'a player called Morgan',
        _repositoryOf,
        namedParameters: <String, Object?>{_repositoryKey: _RecordingPlayerRepository(_player('Morgan'))},
        providers: _overrides,
      )
      .when('a new nickname is typed and the return key is pressed', (repository, _, tester, providers) async {
        await _pumpRow(tester, providers);
        await tester.enterText(find.byType(TextField), 'Ada');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        return repository.written;
      })
      .then('the new nickname is saved', (written, _, _) => written.should.be(<Player>[_player('Ada')]));

  givenWidget(
        'a player called Morgan',
        _repositoryOf,
        namedParameters: <String, Object?>{_repositoryKey: _RecordingPlayerRepository(_player('Morgan'))},
        providers: _overrides,
      )
      .when('a new nickname is typed and the field loses focus without a return', (
        repository,
        _,
        tester,
        providers,
      ) async {
        await _pumpRow(tester, providers);
        await tester.enterText(find.byType(TextField), 'Ada');
        FocusManager.instance.primaryFocus?.unfocus();
        await tester.pump();

        return (repository.written, _fieldText(tester));
      })
      .then('nothing is saved and the row goes back to the name the session holds', (result, _, _) {
        final (List<Player> written, String field) = result;

        written.should.beEmpty();
        field.should.be('Morgan');
      });

  givenWidget(
        'a player called Morgan',
        _repositoryOf,
        namedParameters: <String, Object?>{_repositoryKey: _RecordingPlayerRepository(_player('Morgan'))},
        providers: _overrides,
      )
      .when('the field is emptied to whitespace and the return key is pressed', (
        repository,
        _,
        tester,
        providers,
      ) async {
        await _pumpRow(tester, providers);
        await tester.enterText(find.byType(TextField), '   ');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        return (repository.written, _fieldText(tester));
      })
      .then('it is a change that was never made, so there is no error to show', (result, _, _) {
        final (List<Player> written, String field) = result;

        written.should.beEmpty();
        field.should.be('Morgan');
      });

  givenWidget(
        'a player called Morgan',
        _repositoryOf,
        namedParameters: <String, Object?>{_repositoryKey: _RecordingPlayerRepository(_player('Morgan'))},
        providers: _overrides,
      )
      .when('a nickname padded with spaces is typed and the return key is pressed', (
        repository,
        _,
        tester,
        providers,
      ) async {
        await _pumpRow(tester, providers);
        await tester.enterText(find.byType(TextField), '  Ada  ');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        return (repository.written, _fieldText(tester));
      })
      .then('the domain trims it, and the row shows what was stored rather than what was typed', (
        result,
        _,
        _,
      ) {
        final (List<Player> written, String field) = result;

        written.should.be(<Player>[_player('Ada')]);
        field.should.be('Ada');
      });
}
