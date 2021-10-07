// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flector/features/calculator/domain/entities/ada_reward.dart';
import 'package:flector/features/calculator/domain/usecases/ada_reward_usecase.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flector/features/settings/presentation/cubit/currency_cubit.dart';
import 'package:injectable/injectable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

@injectable
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final AdaRewardUsecase _adaRewardUsecase;
  final CurrencyCubit _currencyCubit;
  StreamSubscription? _currencySubscription;

  CalculatorBloc(this._adaRewardUsecase, this._currencyCubit)
      : super(CalculatorInitial()) {
    _onCurrencyChange();
    on<GetAdaReward>(_onStarted);
  }

  void _onCurrencyChange() {
    _currencySubscription = _currencyCubit.stream.listen((event) {
      final currentState = state;
      if (currentState is Loaded) {
        add(GetAdaReward(wallet: currentState.wallet));
      }
    });
  }

  Future<void> _onStarted(
      GetAdaReward event, Emitter<CalculatorState> emit) async {
    emit(Loading());
    final currency = _currencyCubit.state;
    final result = await _adaRewardUsecase(
      AdaRewardParams(wallet: event.wallet, currency: currency),
    );
    emit(
      result.fold(
        (l) => Error(message: 'Error: ${l.code}'),
        (r) => Loaded(
          adaReward: r,
          wallet: event.wallet,
          currency: currency,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _currencySubscription?.cancel();
    return super.close();
  }
}
