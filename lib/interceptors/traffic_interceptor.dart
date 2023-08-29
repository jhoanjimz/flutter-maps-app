import 'package:dio/dio.dart';

const accessToken = 'pk.eyJ1IjoiamhvYW5qaW16IiwiYSI6ImNsbHV5ejV3NjE2c2gzcXBnZjUzdDk4bXMifQ.SwNneBLWXb0nnrPNKlOg-g';

class TrafficInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters.addAll({
      'alternatives': true,
      'steps'       : false,
      'geometries'  : 'polyline6',
      'overview'    : 'simplified',
      'access_token': accessToken
    });

    super.onRequest(options, handler);
  }

}