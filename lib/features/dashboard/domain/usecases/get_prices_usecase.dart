import 'package:flector/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flector/core/domain/usecase.dart';
import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/features/dashboard/domain/entities/token.dart';
import 'package:flector/features/dashboard/domain/repositories/price_repository.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:injectable/injectable.dart';

class GetPriceParams extends Params {
  final List<Token> token;
  final Currency currency;

  GetPriceParams({
    required this.token,
    required this.currency,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [token, currency];
}

// abstract class AdaRewardUsecase extends UseCase<AdaReward, AdaRewardParams> {}
abstract class GetPricesUsecase extends UseCase<List<Price>, GetPriceParams> {}

@Injectable(as: GetPricesUsecase)
class GetPricesUsecaseImpl extends GetPricesUsecase {
  final PriceRepository _priceRepository;

  GetPricesUsecaseImpl(this._priceRepository);

  @override
  Future<Either<Failure, List<Price>>> execute(GetPriceParams params) async {
    return _priceRepository.getPrices(
        params.token.map((e) => e.id).toList(), params.currency);
  }
}
