import 'package:flutter/material.dart';

import '../api/index_api.dart';
import '../data_models/game_info/game_info.dart';
import '../http/base_api.dart';

class GameProvider extends ChangeNotifier {
  List<GameInfo> _gameList = [];

  List<GameInfo> get gameList => _gameList;

  void getGameInfoListRequest() async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getGameInfoByParams,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {"req_params": "2"};
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final List<GameInfo> games = (result as List)
              .map((dynamic item) => GameInfo.fromMap(item))
              .toList();
          _gameList = games;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }
}
