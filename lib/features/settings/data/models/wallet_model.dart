import 'package:json_annotation/json_annotation.dart';

part 'wallet_model.g.dart';

@JsonSerializable()
class WalletModel {
  final String address;

  const WalletModel({required this.address});

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
  Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}
