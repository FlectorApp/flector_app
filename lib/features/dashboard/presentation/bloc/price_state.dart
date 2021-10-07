part of 'price_bloc.dart';

abstract class PriceState extends Equatable {
  const PriceState();

  @override
  List<Object> get props => [];
}

class PriceInitial extends PriceState {}

class PriceLoading extends PriceState {}

class PriceError extends PriceState {
  final String message;

  const PriceError({required this.message});

  @override
  List<Object> get props => [message];
}

class PriceLoaded extends PriceState {
  final List<Price> prices;

  const PriceLoaded(this.prices);

  @override
  List<Object> get props => [prices];
}
