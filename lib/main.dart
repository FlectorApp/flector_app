import 'package:flector/core/presentation/theme/app_theme.dart';
import 'package:flector/features/main_screen/presentation/pages/main_screen_page.dart';
import 'package:flector/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flector/features/settings/presentation/provider/global_settings_provider.dart';
import 'package:flector/generated/l10n.dart';
import 'package:flector/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  await configureDependencies({});

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalSettingsProvider(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flector',
            theme: appThemeLight(),
            darkTheme: appThemeDark(),
            themeMode: themeMode,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const MainScreenPage(),
          );
        },
      ),
    );
  }
}
