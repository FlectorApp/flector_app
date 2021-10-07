import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/core/widget/responsive_layout.dart';
import 'package:flector/features/calculator/presentation/pages/calculator_page.dart';
import 'package:flector/features/dashboard/presentation/bloc/price_bloc.dart';
import 'package:flector/features/dashboard/presentation/pages/rewards_page.dart';
import 'package:flector/features/dashboard/presentation/widgets/market_info_bar.dart';

import 'package:flector/features/main_screen/presentation/widgets/header.dart';
import 'package:flector/features/main_screen/presentation/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PriceBloc>()..add(FetchPrices()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      header: Header(),
      children: [
        MarketInfoBar(),
        Padding(padding: EdgeInsets.all(defaultPadding / 2)),
        RewardsPage()
      ],
    );
  }
}
