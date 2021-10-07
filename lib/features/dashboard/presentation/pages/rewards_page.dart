import 'package:auto_size_text/auto_size_text.dart';
import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/features/calculator/presentation/widgets/reward_table.dart';
import 'package:flector/features/dashboard/presentation/bloc/rewards_bloc.dart';
import 'package:flector/features/settings/presentation/widgets/wallet_settings_dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<RewardsBloc>()
        ..add(
          const FetchRewards(),
        ),
      child: const _RewardsView(),
    );
  }
}

class _RewardsView extends StatelessWidget {
  const _RewardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'Rewards'.toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
                InkWell(
                  onTap: () =>
                      context.read<RewardsBloc>().add(const FetchRewards()),
                  child: Container(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      decoration: const BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Icon(
                        Icons.refresh,
                        size: 16,
                      )),
                )
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            BlocBuilder<RewardsBloc, RewardsState>(
              builder: (context, state) {
                if (state is Loaded) {
                  return RewardTable(
                    adaReward: state.adaReward,
                    currency: state.currency,
                  );
                } else if (state is Loading) {
                  return const LinearProgressIndicator();
                } else if (state is Error) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          'An error has occurred. Check your wallet.',
                          style: Theme.of(context).textTheme.overline,
                        ),
                        const SizedBox(height: defaultPadding),
                        TextButton(
                          onPressed: () {
                            showWalletDialog(context);
                          },
                          child: const Text('Change wallet'),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: Column(
                    children: [
                      Text(
                        'To see rewards, add a wallet.',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      const SizedBox(height: defaultPadding),
                      TextButton(
                        onPressed: () {
                          showWalletDialog(context);
                        },
                        child: const Text('Add wallet'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
