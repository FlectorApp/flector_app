import 'package:auto_size_text/auto_size_text.dart';
import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/features/dashboard/domain/entities/token.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class PriceInfoCard extends StatelessWidget {
  final String label;
  final Price? price;

  const PriceInfoCard({
    Key? key,
    required this.label,
    this.price,
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
                  label.toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
                Container(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: (price?.change24h ?? 0) >= 0
                      ? const Icon(
                          Icons.arrow_upward,
                          size: 16,
                        )
                      : const Icon(
                          Icons.arrow_downward,
                          size: 16,
                        ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: AutoSizeText(
                  '${price?.price ?? '-'} ${price?.currency.symbol ?? ''}',
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
