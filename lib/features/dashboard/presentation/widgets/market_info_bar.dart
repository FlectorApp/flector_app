import 'package:collection/collection.dart';
import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flector/core/widget/responsive_layout.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/features/dashboard/domain/entities/token.dart';
import 'package:flector/features/dashboard/presentation/bloc/price_bloc.dart';
import 'package:flector/features/dashboard/presentation/widgets/payout_info_card.dart';
import 'package:flector/features/dashboard/presentation/widgets/price_info_card.dart';
import 'package:flector/features/dashboard/presentation/widgets/volume_info_card.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketInfoBar extends StatelessWidget {
  const MarketInfoBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return BlocBuilder<PriceBloc, PriceState>(
      builder: (context, state) {
        if (state is PriceLoaded) {
          return _ResponsiveMarketCardGridView(
            prices: state.prices,
            size: _size,
          );
        }
        return _ResponsiveMarketCardGridView(
          size: _size,
          prices: const [],
        );
      },
    );
  }
}

class _ResponsiveMarketCardGridView extends StatelessWidget {
  final List<Price> prices;
  const _ResponsiveMarketCardGridView({
    Key? key,
    required this.prices,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _MarketInfoCardGridView(
        prices: prices,
        crossAxisCount: _size.width < 650 ? 2 : 4,
        childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
      ),
      tablet: _MarketInfoCardGridView(prices: prices),
      desktop: _MarketInfoCardGridView(
        prices: prices,
        childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
      ),
    );
  }
}

class _MarketInfoCardGridView extends StatelessWidget {
  final List<Price> prices;
  const _MarketInfoCardGridView({
    Key? key,
    required this.prices,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final adaflectPrice = prices.firstWhereOrNull(
      (element) => element.token == Token.adaflect,
    );
    final adaPrice = prices.firstWhereOrNull(
      (element) => element.token == Token.ada,
    );
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      childAspectRatio: 2,
      children: [
        PriceInfoCard(
          label: Token.ada.name,
          price: adaPrice,
        ),
        PriceInfoCard(
          label: Token.adaflect.name,
          price: adaflectPrice,
        ),
        VolumeInfoCard(
          volume: adaflectPrice?.volume24h,
          currency: adaflectPrice?.currency,
        ),
        PayoutInfoCard(volume: adaflectPrice?.volume24h),
      ],
    );
    // return GridView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: 4,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: crossAxisCount,
    //     crossAxisSpacing: defaultPadding,
    //     mainAxisSpacing: defaultPadding,
    //     childAspectRatio: 2,
    //   ),
    //   itemBuilder: (context, index) => PriceInfoCard(
    //     label: Token.adaflect.name,
    //   ),
    // );
  }
}
