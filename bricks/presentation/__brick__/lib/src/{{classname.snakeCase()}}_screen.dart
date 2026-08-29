import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name.snakeCase()}}/src/providers_di.br.dart';

class {{classname.pascalCase()}}Screen extends ConsumerWidget {
  const {{classname.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch({{classname.camelCase()}}ThemeProvider.select((theme) => theme.backgroundColor));

    return ColoredBox(color: backgroundColor, child: const Placeholder());
  }
}
