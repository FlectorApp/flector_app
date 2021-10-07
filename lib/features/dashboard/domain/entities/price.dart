import 'package:equatable/equatable.dart';
import 'package:flector/features/dashboard/domain/entities/token.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';

class Price extends Equatable {
  final num price;
  final Token token;
  final Currency currency;
  final num marketCap;
  final num volume24h;
  final num change24h;
  final DateTime lastUpdated;

  const Price({
    required this.price,
    required this.token,
    required this.currency,
    required this.marketCap,
    required this.volume24h,
    required this.change24h,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        price,
        token,
        currency,
        marketCap,
        volume24h,
        change24h,
        lastUpdated,
      ];
}
