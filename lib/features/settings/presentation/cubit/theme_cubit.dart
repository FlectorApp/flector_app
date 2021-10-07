import 'package:flector/core/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  void setTheme(ThemeMode appTheme) => emit(appTheme);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) =>
      ThemeMode.values[json['theme_mode'] as int];

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {'theme_mode': state.index};
}
