import 'package:dio_http/dio_http.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioFlectorApiModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://flactor-api.herokuapp.com';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}
