const qutil = require("../util/req_utils");
const { resUtil } = require("../util/res_utils");
const format = require("date-fns/format");

exports.getNFTListByType = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let nft_type = reqBody.nft_type;
  if (!nft_type) nft_type = "PROOF_BASED";

  let sql = "SELECT * FROM nft_info WHERE nft_type = :nft_type";
  let nfts = await qutil.qselect(sql, {
    nft_type: nft_type,
  });
  resUtil(ctx, 200, nfts);
};

exports.getNFTRecommandList = async (ctx, next) => {
  let sql =
    "SELECT * FROM nft_info AS i LEFT JOIN nft_detail_info AS d ON i.nft_hash = d.nft_hash ORDER BY hot_rank DESC LIMIT 20";
  let results = await qutil.qselect(sql);
  resUtil(ctx, 200, results);
};

exports.getNFTDetailInfo = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let nft_hash = reqBody.nft_hash;
  let sql =
    "SELECT * FROM nft_info AS i LEFT JOIN nft_detail_info AS d ON i.nft_hash = d.nft_hash WHERE i.nft_hash = :nft_hash";
  let nfts = await qutil.qselect(sql, {
    nft_hash: nft_hash,
  });
  let nft = nfts[0];
  resUtil(ctx, 200, nft);
};

