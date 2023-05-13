const qutil = require("../util/req_utils");
const { resUtil } = require("../util/res_utils");
const { ethers } = require("ethers");

exports.getUserSimpleBaseInfo = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let user_id = reqBody.user_id; //change it to user_hash
  let sql = "SELECT * FROM user_info WHERE id = :user_id";
  let users = await qutil.qselect(sql, {
    user_id: user_id,
  });
  if (users.length === 0) resUtil(ctx, 500, null);
  else resUtil(ctx, 200, users[0]);
};

exports.createUserWeb3State = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let user_hash = reqBody.user_hash;
  // https://data-seed-prebsc-1-s1.binance.org:8545
  // https://data-seed-prebsc-2-s1.binance.org:8545
  // https://data-seed-prebsc-1-s2.binance.org:8545
  // https://data-seed-prebsc-2-s2.binance.org:8545
  // https://data-seed-prebsc-1-s3.binance.org:8545
  // https://data-seed-prebsc-2-s3.binance.org:8545

  let sel_sql = "SELECT * FROM user_info_web3 WHERE user_hash = :user_hash";
  let web3Infos = await qutil.qselect(sel_sql, {
    user_hash,
  });

  if (web3Infos.length === 0) {
    // const provider = new ethers.providers.JsonRpcProvider(rpc);
    const wallet = ethers.Wallet.createRandom();
    let private_key = wallet.privateKey;
    let wallet_address = wallet.address;
    let insert_sql =
      "INSERT INTO user_info_web3 (user_hash , wallet_address , private_key, is_web3_private) " +
      " VALUES (:user_hash , :wallet_address , :private_key ,:is_web3_private)";

    await qutil.qinsert(insert_sql, {
      user_hash,
      wallet_address,
      private_key,
      is_web3_private: 0,
    });
  }
  resUtil(ctx, 200);
};
