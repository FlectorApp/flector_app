import 'package:flector/features/settings/domain/entities/currency.dart';

class AdaReward {
  final num pending;
  final num pendingCurrency;
  final num total;
  final num totalCurrency;
  final DateTime? lastRewardDate;
  final Currency currency;

  AdaReward({
    required this.pending,
    required this.pendingCurrency,
    required this.total,
    required this.totalCurrency,
    required this.lastRewardDate,
    required this.currency,
  });
}
