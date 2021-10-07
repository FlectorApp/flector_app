import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/features/calculator/presentation/bloc/calculator_bloc.dart';
import 'package:flector/features/calculator/presentation/widgets/info_dialog.dart';
import 'package:flector/features/calculator/presentation/widgets/reward_table.dart';
import 'package:flector/features/calculator/presentation/widgets/wallet_input.dart';
import 'package:flector/features/settings/presentation/widgets/settings_dialog_helper.dart';
import 'package:flector/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CalculatorBloc>()
        ..add(
            GetAdaReward(wallet: '0x44A1727b494C71172E3898d0c82d1cE26eC7fB0e')),
      child: const _CalculatorView(),
    );
  }
}

class _CalculatorView extends StatelessWidget {
  const _CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Rewards'.toUpperCase(),
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            // WalletInput(
            //   onShowRewards: (wallet) => context.read<CalculatorBloc>().add(
            //         GetAdaReward(
            //           wallet: wallet,
            //         ),
            //       ),
            // ),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                if (state is Loaded) {
                  return RewardTable(
                    adaReward: state.adaReward,
                    currency: state.currency,
                  );
                } else if (state is Loading) {
                  return const LinearProgressIndicator();
                } else if (state is Error) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Error'),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}

// BlocBuilder<CalculatorBloc, CalculatorState>(
//             builder: (context, state) {
//           if (state is Loaded) {
//             return RewardCard(state.adaReward);
//           }
//           return Container();
//         })