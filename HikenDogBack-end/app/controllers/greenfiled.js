// import { GRPC_URL } from "@/config";
// import { makeRpcClient } from "@bnb-chain/greenfield-chain-sdk";
const { makeRpcClient } = require("@bnb-chain/greenfield-chain-sdk");
// import Long from "long";
// import { QueryClientImpl as spQueryClientImpl } from "@bnb-chain/greenfield-cosmos-types/greenfield/sp/query";
// import { QueryClientImpl as storageQueryClientImpl } from "@bnb-chain/greenfield-cosmos-types/greenfield/storage/query";
// const {
//   QueryClientImpl,
// } = require("@bnb-chain/greenfield-cosmos-types/greenfield/storage/query");

const {
  QueryClientImpl: storageQueryClientImpl,
} = require("@bnb-chain/greenfield-cosmos-types/greenfield/storage/query");

// module.exports = {
//   storageQueryClientImpl
// };

let GRPC_URL = "https://gnfd-testnet-fullnode-tendermint-us.bnbchain.org";

async function getBucketInfo(rpcUrl, bucketName) {
  const rpcClient = await makeRpcClient(rpcUrl);
  const rpc = new storageQueryClientImpl(rpcClient);
  const bucketInfoRes = await rpc.HeadBucket({
    bucketName,
  });

  const bucketId = bucketInfoRes?.bucketInfo?.id;
  if (!bucketId) throw new Error("no such bucket");

  let result = await rpc.HeadBucketById({
    bucketId,
  });
  console.log("result", result);
}

async function getObjectInfo(rpcUrl, bucketName, objectName) {
  const rpcClient = await makeRpcClient(rpcUrl);
  rpcClient.spClient
  const rpc = new storageQueryClientImpl(rpcClient);
  const objInfoRes = await rpc.HeadObject({
    bucketName,
    objectName,
  });


  const objectId = objInfoRes?.objectInfo?.id;
  if (!objectId) throw new Error("no such object");

  let result = await rpc.HeadObjectById({
    objectId,
  });
  console.log(result.objectInfo.checksums);
}

// getBucketInfo(GRPC_URL, "shanbucket");
// getObjectInfo(GRPC_URL, "shan-dapp", "IMG_2147.JPG");

// # TESTNET
// NEXT_PUBLIC_GRPC_URL=https://gnfd-testnet-fullnode-tendermint-us.bnbchain.org

// NEXT_PUBLIC_GREENFIELD_RPC_URL=https://gnfd-testnet-ethapi-us.bnbchain.org
// NEXT_PUBLIC_GREEN_CHAIN_ID=5600

// # BSC End POINT
// NEXT_PUBLIC_BSC_RPC_URL=https://gnfd-bsc-testnet-dataseed1.bnbchain.org
// NEXT_PUBLIC_BSC_CHAIN_ID=5601

// NEXT_PUBLIC_TOKEN_HUB_CONTRACT_ADDRESS=0x10C6E9530F1C1AF873a391030a1D9E8ed0630D26
// NEXT_PUBLIC_CROSS_CHAIN_CONTRACT_ADDRESS=0xeEBe00Ac0756308ac4AaBfD76c05c4F3088B8883
