part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class GetAdaReward extends CalculatorEvent {
  final String wallet;

  const GetAdaReward({required this.wallet});

  @override
  List<Object?> get props => [wallet];
}
