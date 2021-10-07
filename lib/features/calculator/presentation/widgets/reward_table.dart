import 'package:flector/features/calculator/domain/entities/ada_reward.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class RewardTable extends StatelessWidget {
  final AdaReward adaReward;
  final Currency currency;

  const RewardTable({
    Key? key,
    required this.adaReward,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        children: [
          TableRow(children: [
            const TableCell(child: Text('Unpaid:')),
            BalanceTableCell(
              amount: adaReward.pending,
              currency: 'ADA',
            ),
            BalanceTableCell(
              amount: adaReward.pendingCurrency,
              currency: currency.isoCode,
            ),
          ]),
          TableRow(
            children: [
              const TableCell(child: Text('Paid:')),
              BalanceTableCell(
                amount: adaReward.total - adaReward.pending,
                currency: 'ADA',
              ),
              BalanceTableCell(
                amount: adaReward.totalCurrency - adaReward.pendingCurrency,
                currency: currency.isoCode,
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(child: Text('Total:')),
              BalanceTableCell(
                amount: adaReward.total,
                currency: 'ADA',
              ),
              BalanceTableCell(
                amount: adaReward.totalCurrency,
                currency: currency.isoCode,
              ),
            ],
          ),
          if (adaReward.lastRewardDate != null)
            TableRow(
              children: [
                const TableCell(child: Text('Last payout:')),
                TableCell(child: Container()),
                TableCell(
                  child: Text(
                    '${DateTime.now().difference(adaReward.lastRewardDate!).inHours} hours ago',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class BalanceTableCell extends StatelessWidget {
  final String currency;
  final num amount;

  const BalanceTableCell({
    Key? key,
    required this.currency,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Text(
      '${amount.toStringAsFixed(2)} $currency',
      textAlign: TextAlign.end,
    ));
  }
}
