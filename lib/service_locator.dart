// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'service_locator.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies(Set<String> environments) async {
  $initGetIt(GetIt.I, environmentFilter: NoEnvOrContainsAny(environments));
}
