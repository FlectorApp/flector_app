import 'package:auto_size_text/auto_size_text.dart';
import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class VolumeInfoCard extends StatelessWidget {
  final num? volume;
  final Currency? currency;

  const VolumeInfoCard({
    Key? key,
    required this.volume,
    required this.currency,
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
                  '24h volume'.toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
                Container(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      size: 16,
                    ))
              ],
            ),
            Expanded(
              child: Center(
                child: AutoSizeText(
                  '${volume?.toStringAsFixed(0) ?? '-'} ${currency?.symbol ?? ''}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
