import 'package:flector/core/domain/result.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';

// ignore: one_member_abstracts
abstract class PriceRepository {
  Future<Result<List<Price>>> getPrices(
      List<String> tokenIds, Currency currency);
}
