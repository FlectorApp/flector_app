import 'package:flector/features/settings/domain/entities/currency.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CurrencyCubit extends HydratedCubit<Currency> {
  CurrencyCubit() : super(Currency.usd);

  void setCurrency(Currency currency) {
    emit(currency);
  }

  @override
  Currency? fromJson(Map<String, dynamic> json) =>
      Currency.values[json['currency'] as int];

  @override
  Map<String, dynamic>? toJson(Currency state) => {'currency': state.index};
}
