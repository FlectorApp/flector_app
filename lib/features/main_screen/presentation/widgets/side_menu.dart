import 'package:flector/features/main_screen/presentation/cubit/menu_cubit.dart';
import 'package:flector/features/settings/presentation/widgets/settings_dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo.png'),
          ),
          DrawerListTile(
            title: 'Dashboard',
            icon: Icons.dashboard,
            press: () {
              _closeMenu(context);
            },
          ),
          DrawerListTile(
            title: 'ADAFlect.com',
            icon: Icons.shopping_bag,
            press: () {
              launch('https://adaflect.com');
            },
          ),
          DrawerListTile(
            title: 'Settings',
            icon: Icons.settings,
            press: () {
              _closeMenu(context);
              showSettingsDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _closeMenu(BuildContext context) {
    context.read<MenuCubit>().closeMenu();
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.button!,
      ),
    );
  }
}
