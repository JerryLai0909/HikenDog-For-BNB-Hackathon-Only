const router = require("koa-router")();
const controller = require("../controllers");

//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//                        SHAN
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//            层峦叠嶂群山路     打开手机做任务
//            佛主保佑黑客松     一切顺利全跑通

router.get("/");
router.get("welcome", async (ctx, next) => {
  ctx.body = "Welcome the node.js";
});

let basePath = "shan_api/";
router.get(basePath + "getMainInfoData", controller.base_info.getMainInfoData);
router.post(basePath + "getMainInfoData", controller.base_info.getMainInfoData);

/**
 * User
 */
router.post(
  basePath + "getUserSimpleBaseInfo",
  controller.user_info.getUserSimpleBaseInfo
);

router.post(
  basePath + "createUserWeb3State",
  controller.user_info.createUserWeb3State
);

//game
router.post(
  basePath + "getGameInfoByParams",
  controller.game_info.getGameInfoByParams
);

//mission
router.post(
  basePath + "getMissionList",
  controller.mission_info.getMissionList
);

router.post(
  basePath + "getMissionDetailByMisOrGameHash",
  controller.mission_info.getMissionDetailByMisOrGameHash
);

router.post(
  basePath + "getMissionDetail2Flags",
  controller.mission_info.getMissionDetail2Flags
);

//nft
router.post(
  basePath + "getNFTListByType",
  controller.nft_info.getNFTListByType
);

router.post(
  basePath + "getNFTRecommandList",
  controller.nft_info.getNFTRecommandList
);

router.post(
  basePath + "getNFTDetailInfo",
  controller.nft_info.getNFTDetailInfo
);

module.exports = router;
