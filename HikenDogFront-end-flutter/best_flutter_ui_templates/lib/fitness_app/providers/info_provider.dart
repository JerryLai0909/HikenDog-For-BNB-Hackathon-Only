import 'package:flutter/material.dart';

import '../api/index_api.dart';
import '../data_models/game_info/game_info.dart';
import '../data_models/info.dart';
import '../http/base_api.dart';

class InfoProvider with ChangeNotifier {
  String _title = '';
  List<Info> _infoList = [];
  List<GameInfo> _gameInfo = [];

  String get title => _title;
  List<Info> get infoList => _infoList;
  List<GameInfo>? get gameInfo => _gameInfo;

  void getGameInfoListRequest() async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getGameMainInfoList,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {};
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final List<GameInfo> games = (result as List)
              .map((dynamic item) => GameInfo.fromMap(item))
              .toList();
          _gameInfo = games;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }

  void getInfoListRequest() async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getMainInfoData,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {
      "type": "top",
      "key": "e7298127f641182ecd04828e680ceb55"
    };
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final List<Info> infos = (result as List)
              .map((dynamic item) => Info.fromMap(item))
              .toList();

          _title = infos[2].title!;
          _infoList = infos;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }
}
