const qutil = require("../util/req_utils");
const { resUtil } = require("../util/res_utils");

/**
 * 获取game信息，参数的意义在于请求获得不同层级的数据
 * 2 为单纯的desc 和media 数据
 * 3 为携带任务的数据，也是目前为止最详尽的请求
 */
exports.getGameInfoByParams = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let req_params = reqBody.req_params;
  if (!req_params) req_params = 1;
  let select_sql = "SELECT * FROM game_info WHERE 1 = 1 ORDER BY id";
  let games = await qutil.qselect(select_sql);
  for (let i = 0; i < games.length; i++) {
    let game = games[i];
    //desc & media
    if (req_params >= 2) {
      let desc_sql =
        "SELECT * FROM game_2_desc_info WHERE game_hash = :game_hash";
      let descs = await qutil.qselect(desc_sql, { game_hash: game.game_hash });
      game.game_desc = descs;

      let media_sql =
        "SELECT * FROM game_2_media_info WHERE game_hash = :game_hash";
      let medias = await qutil.qselect(media_sql, {
        game_hash: game.game_hash,
      });
      game.game_media = medias;
    }
    //misson
    if (req_params >= 3 && 1 !== 1) {
      let mission_sql = "SELECT * FROM ";
    }
    //else
    if (req_params >= 4 && 1 !== 1) {
    }
  }
  resUtil(ctx, 200, games);
};




// const { makeRpcClient } = require("@bnb-chain/greenfield-chain-sdk");
// const { storageQueryClientImpl } =
//   require("@bnb-chain/greenfield-cosmos-types/greenfield/storage/query").QueryClientImpl;

// exports.getGreenFieldTestInfo = async (ctx, next) => {
//   // let rpcUrl = "https://gnfd-testnet-ethapi-us.bnbchain.org";
//   let rpcUrl = "gnfd-testnet-fullnode-cosmos-us.bnbchain.org:9090";
//   let bucketName = "shan-dapp";
//   const rpcClient = await makeRpcClient(rpcUrl);
//   console.log("rpcClient", rpcClient);

//   const rpc = new storageQueryClientImpl(rpcClient);
//   const bucketInfoRes = await rpc.HeadBucket({
//     bucketName,
//   });

//   const bucketId = bucketInfoRes?.bucketInfo?.id;
//   if (!bucketId) throw new Error("no such bucket");

//   let result = await rpc.HeadBucketById({
//     bucketId,
//   });

//   return resUtil(ctx, 200, result);
// };
