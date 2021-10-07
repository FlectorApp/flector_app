part of 'wallet_cubit.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}

class WalletSaved extends WalletState {
  final Wallet wallet;

  const WalletSaved(this.wallet);

  @override
  List<Object> get props => [wallet];
}
