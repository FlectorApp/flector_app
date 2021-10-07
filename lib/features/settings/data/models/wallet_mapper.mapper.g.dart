// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class WalletMapperImpl extends WalletMapper {
  WalletMapperImpl() : super();

  @override
  Wallet fromModel(WalletModel model) {
    final wallet = Wallet(address: model.address);
    return wallet;
  }

  @override
  WalletModel fromEntity(Wallet entity) {
    final walletmodel = WalletModel(address: entity.address);
    return walletmodel;
  }
}
