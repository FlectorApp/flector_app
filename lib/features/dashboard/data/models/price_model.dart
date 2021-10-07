import 'package:flector/features/dashboard/domain/entities/token.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';

class PriceModel {
  final num price;
  final Token token;
  final Currency currency;
  final num marketCap;
  final num volume24h;
  final num change24h;
  final DateTime lastUpdated;

  const PriceModel({
    required this.price,
    required this.token,
    required this.currency,
    required this.marketCap,
    required this.volume24h,
    required this.change24h,
    required this.lastUpdated,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json, Token token) {
    final currency = _findCurrency(json);
    return PriceModel(
      price: json[currency.name],
      token: token,
      currency: currency,
      marketCap: json['${currency.name}_market_cap'],
      volume24h: json['${currency.name}_24h_vol'],
      change24h: json['${currency.name}_24h_change'],
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(
          int.parse('${json['last_updated_at']}000')),
    );
  }

  static List<PriceModel> fromPriceJson(Map<String, dynamic> json) {
    final List<PriceModel> prices = List.empty(growable: true);

    json.forEach((key, value) {
      if (key == Token.ada.id) {
        prices.add(
          PriceModel.fromJson(value, Token.ada),
        );
      } else if (key == Token.adaflect.id) {
        prices.add(
          PriceModel.fromJson(value, Token.adaflect),
        );
      }
    });

    return prices;
  }

  static Currency _findCurrency(Map<String, dynamic> json) {
    Currency currency = Currency.usd;
    json.forEach(
      (key, value) {
        if (key.length == 3) {
          switch (key) {
            case 'eur':
              currency = Currency.eur;
              break;
            case 'gbp':
              currency = Currency.gbp;
              break;
            default:
              currency = Currency.usd;
          }
        }
      },
    );
    return currency;
  }
}
