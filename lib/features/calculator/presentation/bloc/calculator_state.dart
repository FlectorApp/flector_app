part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();
}

class CalculatorInitial extends CalculatorState {
  @override
  List<Object> get props => [];
}

class Loading extends CalculatorState {
  @override
  List<Object> get props => [];
}

class Loaded extends CalculatorState {
  final AdaReward adaReward;
  final String wallet;
  final Currency currency;

  const Loaded(
      {required this.adaReward, required this.wallet, required this.currency});

  @override
  List<Object> get props => [adaReward];
}

class Error extends CalculatorState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
