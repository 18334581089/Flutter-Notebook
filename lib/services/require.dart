import 'package:dio/dio.dart';

Dio _dio = Dio();

Future<ResultData> api(
  url,
  _params,
  Map<String, dynamic>? header,
  _option,
) async {
  Response _response;
  try {
    _response = await _dio.request(url, data: _params, options: _option);
    return ResultData(_response, true, 200);
  } catch (e) {
    return ResultData("请求失败了!", false, 500);
  }
}

/// 网络结果数据
/// Created by guoshuyu
class ResultData {
  var data;
  bool result;
  int? code;
  var headers;

  ResultData(this.data, this.result, this.code, {this.headers});
}
