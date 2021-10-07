part of 'rewards_bloc.dart';

abstract class RewardsState extends Equatable {
  const RewardsState();

  @override
  List<Object> get props => [];
}

class RewardsInitial extends RewardsState {}

class Loading extends RewardsState {
  @override
  List<Object> get props => [];
}

class Loaded extends RewardsState {
  final AdaReward adaReward;
  final String wallet;
  final Currency currency;

  const Loaded(
      {required this.adaReward, required this.wallet, required this.currency});

  @override
  List<Object> get props => [adaReward];
}

class Error extends RewardsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
