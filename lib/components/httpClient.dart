import 'dart:async';

import 'package:dio/dio.dart';

class HttpClient {
  static Future<T> get<T>(final String uri, {Map param}) async {
    Dio dio = new Dio();
    param = _concatDefaultParam(param);
    var url = _getUrl(uri, param: param);
    print('request: ${param}');
    print('url: ${url}');
    Response<T> response =
        await dio.get(url, options: _options());
    print('repsonse: ${response.data}');
    return response.data;
  }

  static Future<T> post<T>(final String uri, {Map param}) async {
    Dio dio = new Dio();
    param = _concatDefaultParam(param);
    Response<T> response =
        await dio.post(_getUrl(uri, param: param), options: _options());
    print(response.data);
    return response.data;
  }

  static Map _concatDefaultParam(Map param) {
    if (param == null) {
      param = {};
    }
    return param;
  }

  static String _getUrl(String uri, {Map param}) {
    List u = ['https://poetry.mmtou.xyz', uri];
    if (param != null && param.length > 0) {
      List p = [];
      var keys = param.keys;
      for (String key in keys) {
        p.add([key, '=', param[key]].join(''));
      }
      u.add('?');
      u.add(p.join('&'));
    }
    return u.join('');
  }

  static Options _options() {
    return Options(headers: {});
  }
}
