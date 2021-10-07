// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio_http/dio_http.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/datasources/dio_flactor_api_module.dart' as _i20;
import 'features/calculator/data/datasources/ada_flect_remote_data_source.dart'
    as _i9;
import 'features/calculator/data/models/ada_reward_mapper.dart' as _i3;
import 'features/calculator/data/repositories/ada_flect_repository_impl.dart'
    as _i11;
import 'features/calculator/domain/repositories/ada_flect_repository.dart'
    as _i10;
import 'features/calculator/domain/usecases/ada_reward_usecase.dart' as _i12;
import 'features/calculator/presentation/bloc/calculator_bloc.dart' as _i13;
import 'features/dashboard/data/datasources/coin_gecko_data_source.dart'
    as _i14;
import 'features/dashboard/data/repositories/price_repository_impl.dart'
    as _i16;
import 'features/dashboard/domain/repositories/price_repository.dart' as _i15;
import 'features/dashboard/domain/usecases/get_prices_usecase.dart' as _i18;
import 'features/dashboard/presentation/bloc/price_bloc.dart' as _i19;
import 'features/dashboard/presentation/bloc/rewards_bloc.dart' as _i17;
import 'features/main_screen/presentation/cubit/menu_cubit.dart' as _i5;
import 'features/settings/presentation/cubit/currency_cubit.dart' as _i4;
import 'features/settings/presentation/cubit/theme_cubit.dart' as _i6;
import 'features/settings/presentation/cubit/wallet_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioFlectorApiModule = _$DioFlectorApiModule();
  gh.lazySingleton<_i3.AdaRewardMapper>(() => _i3.AdaRewardMapperImpl());
  gh.singleton<_i4.CurrencyCubit>(_i4.CurrencyCubit());
  gh.singleton<_i5.MenuCubit>(_i5.MenuCubit());
  gh.factory<String>(() => dioFlectorApiModule.baseUrl,
      instanceName: 'BaseUrl');
  gh.singleton<_i6.ThemeCubit>(_i6.ThemeCubit());
  gh.singleton<_i7.WalletCubit>(_i7.WalletCubit());
  gh.lazySingleton<_i8.Dio>(
      () => dioFlectorApiModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i9.AdaFlectRemoteDataSource>(
      () => _i9.AdaFlectRemoteDataSourceImpl(get<_i8.Dio>()));
  gh.factory<_i10.AdaFlectRepository>(() => _i11.AdaFlectRepositoryImpl(
      get<_i9.AdaFlectRemoteDataSource>(), get<_i3.AdaRewardMapper>()));
  gh.lazySingleton<_i12.AdaRewardUsecase>(
      () => _i12.AdaRewardUsecaseImpl(get<_i10.AdaFlectRepository>()));
  gh.factory<_i13.CalculatorBloc>(() => _i13.CalculatorBloc(
      get<_i12.AdaRewardUsecase>(), get<_i4.CurrencyCubit>()));
  gh.factory<_i14.CoinGeckoDataSource>(
      () => _i14.CoinGeckoDataSourceImpl(get<_i8.Dio>()));
  gh.factory<_i15.PriceRepository>(
      () => _i16.PriceRepositoryImpl(get<_i14.CoinGeckoDataSource>()));
  gh.factory<_i17.RewardsBloc>(() => _i17.RewardsBloc(
      get<_i12.AdaRewardUsecase>(),
      get<_i7.WalletCubit>(),
      get<_i4.CurrencyCubit>()));
  gh.factory<_i18.GetPricesUsecase>(
      () => _i18.GetPricesUsecaseImpl(get<_i15.PriceRepository>()));
  gh.factory<_i19.PriceBloc>(() =>
      _i19.PriceBloc(get<_i18.GetPricesUsecase>(), get<_i4.CurrencyCubit>()));
  return get;
}

class _$DioFlectorApiModule extends _i20.DioFlectorApiModule {}
