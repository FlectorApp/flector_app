// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// EnumeGenerator
// **************************************************************************

extension CurrencyName on Currency {
  String get name => toString().substring(9);
}

extension Currencysymbol on Currency {
  String get symbol {
    switch (this) {
      case Currency.usd:
        return '\$';
      case Currency.eur:
        return '€';
      case Currency.gbp:
        return '£';
    }
  }
}

extension CurrencyisoCode on Currency {
  String get isoCode {
    switch (this) {
      case Currency.usd:
        return 'USD';
      case Currency.eur:
        return 'EUR';
      case Currency.gbp:
        return 'GPB';
    }
  }
}
