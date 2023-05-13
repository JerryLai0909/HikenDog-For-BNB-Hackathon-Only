import 'package:best_flutter_ui_templates/fitness_app/data_models/nft_token_info/nft_detail_info.dart';
import 'package:flutter/material.dart';

import '../api/index_api.dart';
import '../data_models/nft_token_info/nft_info.dart';
import '../http/base_api.dart';

class NFTProvider extends ChangeNotifier {
  List<NFTInfo> _NFTList = [];
  List<NFTDetailInfo> _NFTDetailList = [];
  late NFTDetailInfo _NFTSingle;

  List<NFTInfo> get NFTList => _NFTList;
  List<NFTDetailInfo> get NFTDetailList => _NFTDetailList;
  NFTDetailInfo get NFTSingle => _NFTSingle;

  void getNFTListByType(String nft_type) async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getNFTListByType,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {"nft_type": nft_type};
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final List<NFTInfo> nfts = (result as List)
              .map((dynamic item) => NFTInfo.fromMap(item))
              .toList();
          _NFTList = nfts;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }

  void getNFTRecommandList() async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getNFTRecommandList,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {};
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final List<NFTDetailInfo> nfts = (result as List)
              .map((dynamic item) => NFTDetailInfo.fromMap(item))
              .toList();
          _NFTDetailList = nfts;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }

  void getNFTDetailInfo(String nft_hash) async {
    IndexApi api = IndexApi(
        requestPath: IndexApi.getNFTDetailInfo,
        requestMethod: RequestMethod.post);
    Map<String, dynamic> body = {"nft_hash": nft_hash};
    api.request(
        body: body,
        successCallBack: (res) {
          final result = res.data;
          final NFTDetailInfo nft = NFTDetailInfo.fromMap(result);
          _NFTSingle = nft;
          notifyListeners();
        },
        errorCallBack: (error) {});
  }
}
