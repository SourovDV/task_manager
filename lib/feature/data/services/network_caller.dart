import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/feature/controller/authController.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final String? errorSms;
  Map<String, dynamic>? responseData;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.errorSms,
    this.responseData,
  });
}

class NetworkCaller {
  //get request
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri,headers: {
        'token':AuthController.accessToken??""
      });
      debugPrint("url $url");
      debugPrint("response ${response.body}");
      debugPrint("statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorSms: e.toString(),
      );
    }
  }
  //post request
  static Future<NetworkResponse> postRequest({required String url , Map<String ,dynamic> ? data})async{
   try{
     Uri uri = Uri.parse(url);
     Response response = await post(uri,body: jsonEncode(data),headers: {
       'content-type': 'application/json',
     });
     debugPrint("url $url");
     debugPrint("response body : ${response.body}");
     debugPrint("statusCode ${response.statusCode}");
     if(response.statusCode == 200){
       final decodeResponse = jsonDecode(response.body);
       return NetworkResponse(isSuccess: true, statusCode: response.statusCode,responseData: decodeResponse);
     }else{
       return NetworkResponse(isSuccess: false, statusCode: response.statusCode);
     }
   }catch(e){
     return NetworkResponse(isSuccess: false, statusCode: -1,errorSms: e.toString());
   }
  }
}
