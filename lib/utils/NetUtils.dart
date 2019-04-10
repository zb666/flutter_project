import 'package:http/http.dart' as http;

class NetUtils {
  static Future<String> get(String url, Map<String, dynamic> params) async {
    if (url != null && params != null && params.isNotEmpty) {
      //参数拼接
      StringBuffer sb = StringBuffer('?');
      params.forEach((key, value) {
        sb.write('$key = $value');
      });
      //去掉最后一个
      String paramStr = sb.toString().substring(0, sb.length - 1);
      url += paramStr;
    }
    print('NetUtils: $url');
    http.Response response = await http.get(url);
    return response.body;
  }

//  static Future<String
  static Future<String> post(String url, Map<String, dynamic> params) async {
    http.Response response = await http.post(url, body: params);
    return response.body;
  }
}