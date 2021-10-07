// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ada_reward_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

@LazySingleton(as: AdaRewardMapper)
class AdaRewardMapperImpl extends AdaRewardMapper {
  AdaRewardMapperImpl() : super();

  @override
  AdaReward fromModel(AdaRewardModel model) {
    final adareward = AdaReward(
        pending: model.pending,
        pendingCurrency: model.pendingCurrency,
        total: model.total,
        totalCurrency: model.totalCurrency,
        lastRewardDate: model.lastRewardDate,
        currency: model.currency);
    return adareward;
  }

  @override
  AdaRewardModel fromEntity(AdaReward entity) {
    final adarewardmodel = AdaRewardModel(
        pending: entity.pending,
        pendingCurrency: entity.pendingCurrency,
        total: entity.total,
        totalCurrency: entity.totalCurrency,
        lastRewardDate: entity.lastRewardDate,
        currency: entity.currency);
    return adarewardmodel;
  }
}
