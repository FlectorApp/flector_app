// Project imports:
import 'package:flector/core/domain/result.dart';
import 'package:flector/core/domain/usecase.dart';
import 'package:flector/features/calculator/domain/entities/ada_reward.dart';
import 'package:flector/features/calculator/domain/repositories/ada_flect_repository.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:injectable/injectable.dart';

class AdaRewardParams extends Params {
  final String wallet;
  final Currency currency;

  AdaRewardParams({
    required this.wallet,
    required this.currency,
  });

  @override
  List<Object?> get props => [wallet];
}

abstract class AdaRewardUsecase extends UseCase<AdaReward, AdaRewardParams> {}

@LazySingleton(as: AdaRewardUsecase)
class AdaRewardUsecaseImpl extends AdaRewardUsecase {
  final AdaFlectRepository _repository;

  AdaRewardUsecaseImpl(this._repository);

  @override
  Future<Result<AdaReward>> execute(AdaRewardParams params) async {
    return _repository.reward(params.wallet, params.currency);
  }
}
