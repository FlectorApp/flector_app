import 'package:flector/features/settings/data/models/wallet_model.dart';
import 'package:flector/features/settings/domain/entities/wallet.dart';
import 'package:injectable/injectable.dart';
import 'package:smartstruct/smartstruct.dart';

part 'wallet_mapper.mapper.g.dart';

@Mapper(useInjection: false)
abstract class WalletMapper {
  static WalletMapper get I => WalletMapperImpl();

  Wallet fromModel(WalletModel model);
  WalletModel fromEntity(Wallet entity);
}
