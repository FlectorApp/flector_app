import 'package:flector/core/widget/responsive_layout.dart';
import 'package:flector/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flector/features/main_screen/presentation/cubit/menu_cubit.dart';
import 'package:flector/features/main_screen/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuCubit>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: ResponsiveLayout(
            mobile: const DashboardPage(),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: SideMenu(),
                ),
                Expanded(
                  flex: 5,
                  child: DashboardPage(),
                ),
              ],
            )),
      ),
    );
  }
}
