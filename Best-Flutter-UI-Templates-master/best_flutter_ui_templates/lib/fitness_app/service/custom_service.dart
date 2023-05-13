import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../data_models/response_data.dart';
import '../http/service.dart';

const String customServiceKey = "CustomService";

class CustomService extends Service {
  @override
  String serviceKey() {
    return customServiceKey;
  }

  @override
  Map<String, dynamic>? serviceHeader() {
    Map<String, dynamic> header = <String, dynamic>{};
    // header["token"] = "";
    return header;
  }

  @override
  void initDio() {
    //请求头也可以你在这里设置
    dio.options.headers = {
      "Access-Control-Allow-Origin": "*",
    };
    // dio.options.baseUrl = "http://v.juhe.cn"; //此处只是默认的baseUrl  可通过路由改变baseUrl
    dio.options.baseUrl =
        "http://192.168.3.119:3000"; //此处只是默认的baseUrl  可通过路由改变baseUrl

    dio.options.connectTimeout = Duration(milliseconds: 10000);
    dio.options.receiveTimeout = Duration(milliseconds: 8000);
    ;
    // dio.options.contentType = "application/json";
    //这里还可以添加其他插件
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  @override
  ResponseData responseFactory(Map<String, dynamic> dataMap) {
    final res = ResponseData.fromJson(dataMap);
    if (res.code == 200) {
      return res;
    } else {
      debugPrint(' CUSTOM SERVICE ERROR');
      return res.data;
    }
  }

  String createMessage(List<dynamic> errorVar, String message) {
    String string = message;
    for (var error in errorVar) {
      string = string.replaceFirst("%s", error);
    }
    return string;
  }

  @override
  String errorFactory(DioError error) {
    // 请求错误处理
    String errorMessage = error.message as String;
    switch (error.type) {
      case DioErrorType.badResponse:
        errorMessage = "服务异常";
        break;
      default:
        errorMessage = "网络错误";
    }
    return errorMessage;
  }
}
