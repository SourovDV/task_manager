
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponces{
    int statusCode;
    Map<String,dynamic> ? responcesData;
    String ? errorSms;
    bool isSuccess;
    NetworkResponces({required this.statusCode, this.responcesData,this.errorSms,required this.isSuccess});
}

class NetworkCaller{
// get operation
static Future<NetworkResponces> getRequest({required String url})async{
try{
  Uri uri = Uri.parse(url);
  Response response =await get(uri);
  if(response.statusCode == 200){
    return NetworkResponces(statusCode: response.statusCode, isSuccess: true, responcesData: jsonDecode(response.body));
  }else{
    return NetworkResponces(statusCode: response.statusCode, isSuccess: false, errorSms: "Something wrong");
  }
}catch(e){
  return NetworkResponces(statusCode: -1, isSuccess: false,errorSms: "network issue");
}

}

//post operation
 static Future<NetworkResponces> postRequest({required String url,Map<String,dynamic>? body})async{
    try{
      Uri uri = Uri.parse(url,);
      debugPrint("url => $uri");
      Response response =await post(uri,headers:
        {'Content-Type': 'application/json'},body: jsonEncode(body));
      debugPrint("respond $response");
      debugPrint("body : ${response.body}");
      if(response.statusCode == 200){
        return NetworkResponces(statusCode: response.statusCode, isSuccess: true, responcesData: jsonDecode(response.body));
      }else{
        return NetworkResponces(statusCode: response.statusCode, isSuccess: false, errorSms: "Something wrong");
      }
    }catch(e){
      return NetworkResponces(statusCode: -1, isSuccess: false,errorSms: "network issue");
    }

  }
}