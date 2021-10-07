import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String address;

  const Wallet({required this.address});

  @override
  List<Object> get props => [address];
}
