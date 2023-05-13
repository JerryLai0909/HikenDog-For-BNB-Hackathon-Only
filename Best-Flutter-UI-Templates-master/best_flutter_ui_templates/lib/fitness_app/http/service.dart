import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data_models/response_data.dart';


class Service {
  final Dio dio = Dio();

  late var _baseUrl = "";

  set baseUrl(value) {
    if (_baseUrl == value) {
      return;
    }
    _baseUrl = value;
    dio.options.baseUrl = _baseUrl;
  }

  get baseUrl => _baseUrl;

  Map<String, dynamic>? serviceHeader() {
    return null;
  }

  Map<String, dynamic>? serviceQuery() {
    return null;
  }

  Map<String, dynamic>? serviceBody() {
    return null;
  }

  void initDio() {}

  ///获取到业务数据后的 数据加工
  ResponseData responseFactory(Map<String, dynamic> dataMap) {
    final res = ResponseData.fromJson(dataMap);
    return res;
  }

  ///请求错误处理
  String errorFactory(DioError error) {
    String errorMessage = error.message as String;
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        errorMessage = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "Receive timeout";
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "Send timeout";
        break;
      case DioErrorType.badResponse:
        try {
          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              errorMessage = "语法错误";
          }
        } on Exception catch (_) {
          errorMessage = error.message as String;
        }
        break;
      case DioErrorType.unknown:
        errorMessage = error.message as String;
        break;
      default:
        errorMessage = error.message as String;
    }
    return errorMessage;
  }

  String serviceKey() {
    return "";
  }
}
