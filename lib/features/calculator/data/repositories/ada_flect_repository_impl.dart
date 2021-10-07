import 'package:dartz/dartz.dart';
import 'package:flector/core/domain/result.dart';
import 'package:flector/features/calculator/data/datasources/ada_flect_remote_data_source.dart';
import 'package:flector/features/calculator/data/models/ada_reward_mapper.dart';
import 'package:flector/features/calculator/domain/entities/ada_reward.dart';
import 'package:flector/features/calculator/domain/repositories/ada_flect_repository.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AdaFlectRepository)
class AdaFlectRepositoryImpl extends AdaFlectRepository {
  final AdaFlectRemoteDataSource _adaFlectRemoteDataSource;
  final AdaRewardMapper _adaRewardMapper;

  AdaFlectRepositoryImpl(this._adaFlectRemoteDataSource, this._adaRewardMapper);

  @override
  Future<Result<num>> balance(String wallet) {
    // TODO: implement balance
    throw UnimplementedError();
  }

  @override
  Future<Result<AdaReward>> reward(String wallet, Currency currency) async {
    final result =
        await _adaFlectRemoteDataSource.getAdaReward(wallet, currency);
    return result.fold(
      (l) => Left(l),
      (r) => Right(_adaRewardMapper.fromModel(r)),
    );
  }
}
