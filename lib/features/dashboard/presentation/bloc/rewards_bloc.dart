import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flector/features/calculator/domain/entities/ada_reward.dart';
import 'package:flector/features/calculator/domain/usecases/ada_reward_usecase.dart';
import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:flector/features/settings/presentation/cubit/currency_cubit.dart';
import 'package:flector/features/settings/presentation/cubit/wallet_cubit.dart';
import 'package:injectable/injectable.dart';

part 'rewards_event.dart';
part 'rewards_state.dart';

@injectable
class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  final AdaRewardUsecase _adaRewardUsecase;
  final WalletCubit _walletCubit;
  final CurrencyCubit _currencyCubit;

  StreamSubscription? _currencySubscription;
  StreamSubscription? _walletSubscription;

  RewardsBloc(
    this._adaRewardUsecase,
    this._walletCubit,
    this._currencyCubit,
  ) : super(RewardsInitial()) {
    _onWalletChange();
    _onCurrencyChange();
    on<FetchRewards>(_onStarted);
  }

  void _onCurrencyChange() {
    _currencySubscription = _currencyCubit.stream.listen(
      (event) {
        final currentState = state;
        if (currentState is Loaded) {
          add(const FetchRewards());
        }
      },
    );
  }

  void _onWalletChange() {
    _walletSubscription = _walletCubit.stream.listen(
      (event) {
        add(const FetchRewards());
      },
    );
  }

  Future<void> _onStarted(
      FetchRewards event, Emitter<RewardsState> emit) async {
    emit(Loading());
    final currency = _currencyCubit.state;
    final walletState = _walletCubit.state;
    if (walletState is WalletSaved) {
      final wallet = walletState.wallet.address;
      final result = await _adaRewardUsecase(
        AdaRewardParams(wallet: wallet.trim(), currency: currency),
      );
      emit(
        result.fold(
          (l) => Error(message: 'Error: ${l.code}'),
          (r) => Loaded(
            adaReward: r,
            wallet: wallet,
            currency: currency,
          ),
        ),
      );
    } else {
      return emit(RewardsInitial());
    }
  }

  @override
  Future<void> close() {
    _walletSubscription?.cancel();
    _currencySubscription?.cancel();
    return super.close();
  }
}
