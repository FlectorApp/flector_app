import 'package:dartz/dartz.dart';
import 'package:flector/core/domain/failure.dart';
import 'package:flector/features/dashboard/data/datasources/coin_gecko_data_source.dart';
import 'package:flector/features/dashboard/data/models/price_model_mapper.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/core/domain/result.dart';
import 'package:flector/features/dashboard/domain/repositories/price_repository.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PriceRepository)
class PriceRepositoryImpl implements PriceRepository {
  final CoinGeckoDataSource _coinGeckoDataSource;

  PriceRepositoryImpl(this._coinGeckoDataSource);

  @override
  Future<Result<List<Price>>> getPrices(
      List<String> tokenIds, Currency currency) async {
    final result = await _coinGeckoDataSource.getPrices(tokenIds, currency);
    return result.fold(
      (l) => Left(l),
      (r) => Right(
        r.map((e) => PriceModelMapper.I.fromModel(e)).toList(),
      ),
    );
  }
}
