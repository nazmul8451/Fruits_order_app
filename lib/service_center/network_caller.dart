import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;
  final String? errormessege;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errormessege,
  });
}

class NetworkCaller {
  static const String _defaultErrorMessage = 'Something went wrong';

  static Future<NetworkResponse> postRequest({required String url, Map<String, String>? body,}) async {
    Uri URL = Uri.parse(url);

    debugPrint('Post URL: $URL');
    debugPrint('Post BODY: $body');
    Response response = await post(
        URL,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
    );

    if(response.statusCode == 200){
      final decodeJson = jsonDecode(response.body);
      return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodeJson,
      );
    }else{
      final decodeJson = jsonDecode(response.body);
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        errormessege: decodeJson['data']?? _defaultErrorMessage,
      );
    }
  }
}
