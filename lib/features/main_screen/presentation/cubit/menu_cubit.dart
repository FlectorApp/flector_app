import 'package:bloc/bloc.dart';
import 'package:coingecko_dart/coingecko_dart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'menu_state.dart';

@singleton
class MenuCubit extends Cubit<MenuState> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  MenuCubit() : super(MenuInitial());

  void openMenu() {
    final isOpen = _scaffoldKey.currentState?.isDrawerOpen ?? false;
    if (!isOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void closeMenu() {
    final isOpen = _scaffoldKey.currentState?.isDrawerOpen ?? false;
    if (isOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }
}
