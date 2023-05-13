import 'package:best_flutter_ui_templates/fitness_app/data_models/mission_info/mission_info.dart';
import 'package:flutter/material.dart';

import '../api/index_api.dart';
import '../data_models/mission_info/mission_everything.dart';
import '../http/base_api.dart';

class MissionProvider extends ChangeNotifier {
  List<MissionInfo> _missionList = [];
  MissionInfo _singleMission = new MissionInfo();
  MissionInfo _missionDetail = new MissionInfo();
  List<MissionEverything> _missionEverything =[];
  String _missionMaindesc = '';

  List<MissionInfo> get missionList => _missionList;

  MissionInfo get singleMission => _singleMission;
  MissionInfo get missionDetail => _missionDetail;

  List<MissionEverything> get missionEverything => _missionEverything;

  String get missionMainDesc => _missionMaindesc;

  MissionProvider() {
    _singleMission.mission_name = '正在加载';
    _singleMission.mission_desc1 = '...';
    _singleMission.mission_desc2 = '0';
    _singleMission.end_time = '00-00-00 00:00:00';
    _singleMission.owner_hash = 'Created by Jerry';
    _singleMission.has_token_reward = 0;
    _singleMission.has_nft_reward = 0;
    _singleMission.is_finished = 0;
    _singleMission.mission_media_path1 = '';
    _missionDetail = _singleMission;
  }

  void getMissionDetail2Flags(String mission_hash) async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getMissionDetail2Flags,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {"mission_hash": mission_hash};
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
           final List<MissionEverything> missions = (result as List)
              .map((dynamic item) => MissionEverything.fromMap(item))
              .toList();
          _missionEverything = missions;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }

  void getMissionInfoList() async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getMissionList,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {"req_params": "MIANPAGE_SINGLE"};
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final List<MissionInfo> missions = (result as List)
              .map((dynamic item) => MissionInfo.fromMap(item))
              .toList();
          _singleMission = missions[0];
          _missionList = missions;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }

  void getMissionDetailByMisOrGameHash(Map<String, dynamic> body) async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getMissionDetailByMisOrGameHash,
        requestMethod: RequestMethod.post);
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final MissionInfo misEntity = MissionInfo.fromMap(result);
          _missionDetail = misEntity;
          _missionMaindesc = '';
          final descs = misEntity.desc_info;
          for (int i = 0; i < descs!.length; i++) {
            _missionMaindesc += descs[i].mission_desc_content + '\n';
          }
          notifyListeners();
        },
        errorCallBack: (error) {});
  }
}
