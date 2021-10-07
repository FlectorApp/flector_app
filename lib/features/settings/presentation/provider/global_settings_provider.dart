import 'package:flector/features/main_screen/presentation/cubit/menu_cubit.dart';
import 'package:flector/features/settings/presentation/cubit/currency_cubit.dart';
import 'package:flector/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flector/features/settings/presentation/cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GlobalSettingsProvider extends StatelessWidget {
  final Widget child;

  const GlobalSettingsProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WalletCubit>(
          create: (BuildContext context) => GetIt.I<WalletCubit>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => GetIt.I<ThemeCubit>(),
        ),
        BlocProvider<CurrencyCubit>(
          create: (BuildContext context) => GetIt.I<CurrencyCubit>(),
        ),
        BlocProvider<MenuCubit>(
          create: (BuildContext context) => GetIt.I<MenuCubit>(),
        ),
      ],
      child: child,
    );
  }
}
