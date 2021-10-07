// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ada_reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdaRewardModel _$AdaRewardModelFromJson(Map<String, dynamic> json) =>
    AdaRewardModel(
      pending: json['pending_ada'] as num,
      pendingCurrency: json['pending_usd'] as num,
      total: json['total_ada'] as num,
      totalCurrency: json['total_usd'] as num,
      lastRewardDate:
          AdaRewardModel._fromDate(json['last_reward_date'] as String),
      currency: AdaRewardModel._fromCurrency(json['currency'] as String),
    );

Map<String, dynamic> _$AdaRewardModelToJson(AdaRewardModel instance) =>
    <String, dynamic>{
      'pending_ada': instance.pending,
      'pending_usd': instance.pendingCurrency,
      'total_ada': instance.total,
      'total_usd': instance.totalCurrency,
      'last_reward_date': instance.lastRewardDate?.toIso8601String(),
      'currency': _$CurrencyEnumMap[instance.currency],
    };

const _$CurrencyEnumMap = {
  Currency.usd: 'usd',
  Currency.eur: 'eur',
  Currency.gbp: 'gbp',
};
