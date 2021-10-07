import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/core/widget/responsive_layout.dart';
import 'package:flector/features/main_screen/presentation/cubit/menu_cubit.dart';
import 'package:flector/features/settings/presentation/cubit/wallet_cubit.dart';
import 'package:flector/features/settings/presentation/widgets/wallet_settings_dialog_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (!isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              context.read<MenuCubit>().openMenu();
            },
          ),
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        String walletLabel = 'Wallet';
        if (state is WalletSaved && state.wallet.address.startsWith('0x')) {
          walletLabel = state.wallet.address;
        }

        return InkWell(
          onTap: () => showWalletDialog(context),
          child: Container(
            margin: const EdgeInsets.only(left: defaultPadding),
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.account_balance_wallet_outlined),
                Container(
                  constraints: const BoxConstraints(maxWidth: 75),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2),
                    child: Text(
                      walletLabel,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
