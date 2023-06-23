import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AppLocalizations useIntl() {
  final context = useContext();
  return AppLocalizations.of(context)!;
}
