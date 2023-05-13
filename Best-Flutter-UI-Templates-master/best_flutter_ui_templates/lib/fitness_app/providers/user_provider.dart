import 'package:flutter/material.dart';

import '../api/index_api.dart';
import '../data_models/user.dart';
import '../http/base_api.dart';

class UserProvider with ChangeNotifier {

  User user = new User();


  UserProvider() {
    user.token_count = 0;
    user.user_name = '?';
    user.user_level = '正在加载';
    user.mission_count = 0;
    user.line_count = 0;
  }
  String? get userName => user.user_name;
  int? get missionCount => user.mission_count;
  int? get lineCount => user.line_count;

  void getUserInfoRequest() async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getUserInfo, requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {
      "user_id": "1",
    };
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final User userResult = User.fromMap(result);
          user = userResult;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }
}
