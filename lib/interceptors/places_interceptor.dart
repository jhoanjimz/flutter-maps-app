import 'package:dio/dio.dart';


class PlacesInterceptor extends Interceptor {
  
  final accessToken = 'pk.eyJ1IjoiamhvYW5qaW16IiwiYSI6ImNsbHV5ejV3NjE2c2gzcXBnZjUzdDk4bXMifQ.SwNneBLWXb0nnrPNKlOg-g';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters.addAll({
      'access_token': accessToken,
      'language'    : 'es',
    });

    super.onRequest(options, handler);
  }

}