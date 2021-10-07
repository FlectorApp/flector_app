// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ada_reward_model.g.dart';

@JsonSerializable()
class AdaRewardModel extends Equatable {
  @JsonKey(name: 'pending_ada')
  final num pending;
  @JsonKey(name: 'pending_usd')
  final num pendingCurrency;
  @JsonKey(name: 'total_ada')
  final num total;
  @JsonKey(name: 'total_usd')
  final num totalCurrency;
  @JsonKey(name: 'last_reward_date', fromJson: _fromDate)
  final DateTime? lastRewardDate;
  @JsonKey(name: 'currency', fromJson: _fromCurrency)
  final Currency currency;

  const AdaRewardModel({
    required this.pending,
    required this.pendingCurrency,
    required this.total,
    required this.totalCurrency,
    required this.lastRewardDate,
    required this.currency,
  });

  @override
  List<Object?> get props => [pending, total, lastRewardDate];

  factory AdaRewardModel.fromJson(Map<String, dynamic> json) =>
      _$AdaRewardModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdaRewardModelToJson(this);

  static DateTime? _fromDate(String date) {
    final lastReward = DateTime.parse(date);
    return lastReward.millisecondsSinceEpoch > 0 ? lastReward : null;
  }

  static Currency _fromCurrency(String currency) =>
      Currency.values.firstWhere((element) => element.name == currency);
}
