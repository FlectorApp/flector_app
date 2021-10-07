import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flector/core/domain/failure.dart';

import 'package:flector/features/dashboard/domain/entities/price.dart';
import 'package:flector/features/dashboard/domain/entities/token.dart';
import 'package:flector/features/dashboard/domain/usecases/get_prices_usecase.dart';
import 'package:flector/features/settings/presentation/cubit/currency_cubit.dart';
import 'package:injectable/injectable.dart';

part 'price_event.dart';
part 'price_state.dart';

@injectable
class PriceBloc extends Bloc<PriceEvent, PriceState> {
  final GetPricesUsecase _getPrices;
  final CurrencyCubit _currencyCubit;
  StreamSubscription? _currencySubscription;
  PriceBloc(this._getPrices, this._currencyCubit) : super(PriceInitial()) {
    _onCurrencyChange();
    on<FetchPrices>(_fetchPrices);
  }

  Future<void> _fetchPrices(
    FetchPrices event,
    Emitter<PriceState> emit,
  ) async {
    emit(PriceLoading());
    final currency = _currencyCubit.state;
    final result = await _getPrices(
      GetPriceParams(
        token: const [Token.ada, Token.adaflect],
        currency: currency,
      ),
    );
    emit(
      result.fold(
        (l) => PriceError(message: 'Error: ${l.code}'),
        (r) => PriceLoaded(r),
      ),
    );
  }

  void _onCurrencyChange() {
    _currencySubscription = _currencyCubit.stream.listen((event) {
      final currentState = state;
      if (currentState is PriceLoaded) {
        add(FetchPrices());
      }
    });
  }

  @override
  Future<void> close() {
    _currencySubscription?.cancel();
    return super.close();
  }
}
