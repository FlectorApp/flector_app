part of 'price_bloc.dart';

abstract class PriceEvent extends Equatable {
  const PriceEvent();

  @override
  List<Object> get props => [];
}

class FetchPrices extends PriceEvent {}
