import '../http/base_api.dart';
import '../service/custom_service.dart';

class IndexApi extends BaseApi {
  static String BASE_ASSETS_PATH =
      'https://awsshans3.s3.ap-northeast-1.amazonaws.com/';
  static String getUserInfo = '/getUserSimpleBaseInfo';
  static String getGameInfoByParams = '/getGameInfoByParams';
  static String getMissionList = '/getMissionList';
  static String getMissionDetailByMisOrGameHash =
      '/getMissionDetailByMisOrGameHash';
  static String getMissionDetail2Flags = '/getMissionDetail2Flags';
  static String getNFTListByType = '/getNFTListByType';
  static String getNFTRecommandList = '/getNFTRecommandList';
  static String getNFTDetailInfo = '/getNFTDetailInfo';

  

  static String getMainInfoData = '/getMainInfoData';
  static String createGameInfoAndRecords = '/createGameInfoAndRecords';
  static String getGameMainInfoList = '/getGameMainInfoList';

  String requestPath;
  RequestMethod requestMethod;

  IndexApi({required this.requestPath, required this.requestMethod});

  @override
  String path() {
    return '/shan_api' + requestPath;
  }

  @override
  RequestMethod method() {
    return requestMethod;
  }

  @override
  String serviceKey() {
    return customServiceKey;
  }
}
