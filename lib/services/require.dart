import 'package:dio/dio.dart';

Dio _dio = Dio();

Response _response;
Future api () {
  try {
    _response = await _dio.request(url, data: _params, options: _option)
  } catch (e) {
    print('请求出错了');
    return null;
  }
}
