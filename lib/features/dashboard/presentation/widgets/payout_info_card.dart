import 'package:auto_size_text/auto_size_text.dart';
import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/features/dashboard/domain/entities/payout_speed.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class PayoutInfoCard extends StatelessWidget {
  final num? volume;

  const PayoutInfoCard({
    Key? key,
    required this.volume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'payout speed'.toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
                Container(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(
                      Icons.timer,
                      size: 16,
                    ))
              ],
            ),
            Expanded(
              child: Center(
                child: AutoSizeText(
                  _payoutSpeedLabel(volume),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _payoutSpeedLabel(num? volume) {
    if (volume == null) {
      return '-';
    } else if (volume > PayoutSpeed.perfect.volume) {
      return 'perfect';
    } else if (volume > PayoutSpeed.normal.volume) {
      return 'normal';
    } else if (volume > PayoutSpeed.slow.volume) {
      return 'slow';
    } else {
      return 'very slow';
    }
  }
}
