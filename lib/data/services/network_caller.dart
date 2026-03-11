import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponses {
  final int statusCode;
  final Map<String, dynamic>? responsData;
  final bool isSuccess;
  final String? errorSms;

  NetworkResponses({
    required this.statusCode,
    this.responsData,
    required this.isSuccess,
    this.errorSms,
  });
}

class NetworkCaller {
  //for get api
  static Future<NetworkResponses> getRequest({
    required String url,
    Map<String, dynamic>? parems,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint("${url}");
      Response response = await get(uri);
      debugPrint("${response.body}");
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        return NetworkResponses(
          responsData: jsonDecode(response.body),
          statusCode: response.statusCode,
          isSuccess: true,
        );
      } else {
        return NetworkResponses(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponses(
        statusCode: -1,
        isSuccess: false,
        errorSms: e.toString(),
      );
    }
  }

  //post api
  static Future<NetworkResponses> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async
  {
    try {
      Uri uri = Uri.parse(url);
      debugPrint("${url}");
      Response response = await post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      debugPrint("${response.body}");
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        return NetworkResponses(
          responsData: jsonDecode(response.body),
          statusCode: response.statusCode,
          isSuccess: true,
        );
      } else {
        return NetworkResponses(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponses(
        statusCode: -1,
        isSuccess: false,
        errorSms: e.toString(),
      );
    }
  }

  //delete
// static Future<NetworkResponses> deleteRequest({required String url}){
//
// }
}
