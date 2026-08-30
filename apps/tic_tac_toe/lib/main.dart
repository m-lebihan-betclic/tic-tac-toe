import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tic_tac_toe/application/application.dart';

/// Resolved before the first frame rather than awaited inside a provider, so nothing downstream
/// has to model "the version is not known yet" — a settings footer with an `AsyncValue` in it
/// would be three states for a string that is fixed at build time.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  runApp(buildApplication(version: packageInfo.version));
}
