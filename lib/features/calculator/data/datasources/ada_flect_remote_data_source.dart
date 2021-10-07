// Project imports:
import 'package:dartz/dartz.dart';
import 'package:dio_http/dio_http.dart';
import 'package:flector/core/domain/failure.dart';
import 'package:flector/core/domain/result.dart';
import 'package:flector/features/calculator/data/models/ada_reward_model.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:injectable/injectable.dart';

abstract class AdaFlectRemoteDataSource {
  /// Calls the https://flactor-api.herokuapp.com/rewards/{wallet} endpoint.
  Future<Result<AdaRewardModel>> getAdaReward(String wallet, Currency currency);
  Future<Result<num>> getBalance(String wallet);
}

@Injectable(as: AdaFlectRemoteDataSource)
class AdaFlectRemoteDataSourceImpl extends AdaFlectRemoteDataSource {
  final Dio _httpClient;

  AdaFlectRemoteDataSourceImpl(this._httpClient);

  @override
  Future<Result<AdaRewardModel>> getAdaReward(
      String wallet, Currency currency) async {
    try {
      final response = await _httpClient.get(
        '/rewards/$wallet?currency=${currency.name}',
      );
      return Right(AdaRewardModel.fromJson(response.data));
    } catch (e) {
      // print(e);
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Result<num>> getBalance(String wallet) async {
    // TODO: implement getBalance
    throw UnimplementedError();
  }
}
