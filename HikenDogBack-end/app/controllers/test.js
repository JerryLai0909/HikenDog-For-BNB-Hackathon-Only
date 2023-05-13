// const { makeRpcClient } = require("@bnb-chain/greenfield-chain-sdk");
// const { getGreenFieldTestInfo } = require("./game_info");
// const { storageQueryClientImpl } =
//   require("@bnb-chain/greenfield-cosmos-types/greenfield/storage/query").QueryClientImpl;

// async function greenTest(ctx, next) {
//   // let rpcUrl = "https://gnfd-testnet-ethapi-us.bnbchain.org";
//   let rpcUrl = "gnfd-testnet-fullnode-cosmos-us.bnbchain.org:9090";
//   let bucketName = "shan-dapp";
//   console.log("gogogo");

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
//   console.log(result)
// }

// greenTest();
