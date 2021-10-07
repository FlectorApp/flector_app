// Project imports:
import 'package:flector/core/domain/result.dart';
import 'package:flector/features/calculator/domain/entities/ada_reward.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';

abstract class AdaFlectRepository {
  Future<Result<AdaReward>> reward(String wallet, Currency currency);
  Future<Result<num>> balance(String wallet);
}
