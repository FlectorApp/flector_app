import 'package:clipboard/clipboard.dart';
import 'package:flector/features/settings/presentation/cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showWalletDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              return _WalletSettingsView(
                walletAddress:
                    (state is WalletSaved) ? state.wallet.address : '',
              );
            },
          ),
        );
      });
}

class _WalletSettingsView extends StatelessWidget {
  final String walletAddress;
  const _WalletSettingsView({Key? key, required this.walletAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController.fromValue(
      TextEditingValue(text: walletAddress),
    );
    final _theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.account_balance_wallet),
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              color: _theme.colorScheme.secondary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Wallet',
            style: _theme.textTheme.headline6,
          ),
        ),
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: '0x000...',
            suffixIcon: IconButton(
              onPressed: () {
                FlutterClipboard.paste().then(
                  (value) {
                    _textController.text = value;
                  },
                );
              },
              icon: const Icon(Icons.paste),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<WalletCubit>().setWallet(_textController.text);
            Navigator.pop(context);
          },
          child: const Text('Add wallet'),
        ),
      ],
    );
  }
}
