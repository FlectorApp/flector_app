import 'package:dartz/dartz.dart';
import 'package:dio_http/dio_http.dart';
import 'package:flector/core/domain/failure.dart';
import 'package:flector/core/domain/result.dart';
import 'package:flector/features/dashboard/data/models/price_model.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:injectable/injectable.dart';

abstract class CoinGeckoDataSource {
  Future<Result<List<PriceModel>>> getPrices(
      List<String> tokenIds, Currency currency);
}

@Injectable(as: CoinGeckoDataSource)
class CoinGeckoDataSourceImpl implements CoinGeckoDataSource {
  final Dio _httpClient;

  CoinGeckoDataSourceImpl(this._httpClient);

  @override
  Future<Result<List<PriceModel>>> getPrices(
      List<String> tokenIds, Currency currency) async {
    try {
      final response = await _httpClient.get(
        '/cg/price/?ids=${tokenIds.join(',')}&currency=${currency.name}',
      );
      return Right(PriceModel.fromPriceJson(response.data));
    } catch (e) {
      // print(e);
      return const Left(UnknownFailure());
    }
  }
}
