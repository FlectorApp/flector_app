import 'package:equatable/equatable.dart';
import 'package:flector/features/settings/data/models/wallet_mapper.dart';
import 'package:flector/features/settings/data/models/wallet_model.dart';
import 'package:flector/features/settings/domain/entities/wallet.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'wallet_state.dart';

@singleton
class WalletCubit extends HydratedCubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  void setWallet(String address) {
    final wallet = Wallet(address: address);
    emit(WalletSaved(wallet));
  }

  void removeWallet() => emit(WalletInitial());

  @override
  WalletState? fromJson(Map<String, dynamic> json) {
    return WalletSaved(WalletMapper.I.fromModel(WalletModel.fromJson(json)));
  }

  @override
  Map<String, dynamic>? toJson(WalletState? state) {
    if (state is WalletSaved) {
      return WalletMapper.I.fromEntity(state.wallet).toJson();
    } else {
      return null;
    }
  }
}
