const qutil = require("../util/req_utils");
const { resUtil } = require("../util/res_utils");
const format = require("date-fns/format");

/**
 * return Mission Detail
 */
exports.getMissionDetail2Flags = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let mission_hash = reqBody.mission_hash;
  let sql =
    "SELECT * FROM mission_2_detail AS d LEFT JOIN flag_info AS f ON d.flag_hash = f.flag_hash WHERE mission_hash = :mission_hash";
  let details = await qutil.qselect(sql, {
    mission_hash: mission_hash,
  });
  for (let i = 0; i < details.length; i++) {
    let detail = details[i];
    let misd_hash = detail.misd_hash;
    let flag_hash = detail.flag_hash;
    let mo_hash = detail.mo_hash;
    //mountain
    let mo_sql = "SELECT * FROM mountain_info WHERE mo_hash = :mo_hash";
    let mountains = await qutil.qselect(mo_sql, {
      mo_hash: mo_hash,
    });
    let mountain = mountains[0];
    detail.mountain_info = mountain;
    //misd_desc
    let desc_sql =
      "SELECT * FROM misd_2_desc_info WHERE misd_hash = :misd_hash";
    let descs = await qutil.qselect(desc_sql, {
      misd_hash: misd_hash,
    });
    detail.misd_desc = descs;
    //misd_media
    let media_sql =
      "SELECT * FROM misd_2_media_info WHERE misd_hash = :misd_hash";
    let medias = await qutil.qselect(media_sql, {
      misd_hash: misd_hash,
    });
    detail.misd_media = medias;
    //reward

    let reward_sql = "SELECT * FROM misd_2_reward WHERE misd_hash = :misd_hash";
    let rewards = await qutil.qselect(reward_sql, {
      misd_hash: misd_hash,
    });
    detail.rewards = rewards;
  }
  resUtil(ctx, 200, details);
};

/**
 * return Mission Entity
 */
exports.getMissionDetailByMisOrGameHash = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let mission_hash = reqBody.mission_hash;
  let game_hash = reqBody.game_hash;
  let misEntity;
  if (mission_hash) {
    let sql = "SELECT * FROM mission_info WHERE mission_hash = :mission_hash";
    let mis = await qutil.qselect(sql, {
      mission_hash: mission_hash,
    });
    mis[0].end_time = format(new Date(mis[0].end_time), "yyyy-MM-dd");
    misEntity = mis[0];
  } else if (!mission_hash && game_hash) {
    let sql =
      "SELECT m.*,r.game_hash FROM game_2_mission AS r LEFT JOIN mission_info AS m ON r.mission_hash = m.mission_hash WHERE game_hash = :game_hash";
    let mis = await qutil.qselect(sql, {
      game_hash: game_hash,
    });
    mis[0].end_time = format(new Date(mis[0].end_time), "yyyy-MM-dd");
    misEntity = mis[0];
  } else {
    resUtil(ctx, 200, 0);
  }
  let desc_sql =
    "SELECT * FROM mission_2_desc_info WHERE mission_hash = :mission_hash";

  let descs = await qutil.qselect(desc_sql, {
    mission_hash: misEntity.mission_hash,
  });
  let media_sql =
    "SELECT * FROM mission_2_media_info WHERE mission_hash = :mission_hash";
  let medias = await qutil.qselect(media_sql, {
    mission_hash: misEntity.mission_hash,
  });
  misEntity.desc_info = descs;
  misEntity.media_info = medias;
  resUtil(ctx, 200, misEntity);
};

exports.getMissionList = async (ctx, next) => {
  let reqBody = ctx.request.body;
  let req_params = reqBody.req_params;

  let select_sql = "SELECT * FROM mission_info WHERE 1 = 1 ";
  if (req_params === "MIANPAGE_SINGLE") {
    select_sql += " AND mission_type = 'SINGLE' ORDER BY id ASC LIMIT 1";
  } else if (req_params === "JUST_LIST") {
    select_sql += "";
  } else {
  }
  let missions = await qutil.qselect(select_sql, {
    req_params,
  });

  for (let i = 0; i < missions.length; i++) {
    let mis_hash = missions[i].mission_hash;
    missions[i].end_time = format(new Date(missions[i].end_time), "yyyy-MM-dd");
    let desc_sql =
      "SELECT * FROM mission_2_desc_info WHERE mission_hash = :mission_hash";
    let descs = await qutil.qselect(desc_sql, {
      mission_hash: mis_hash,
    });

    let media_sql =
      "SELECT * FROM mission_2_media_info WHERE mission_hash = :mission_hash";
    let medias = await qutil.qselect(media_sql, {
      mission_hash: mis_hash,
    });

    missions[i].desc_info = descs;
    missions[i].media_info = medias;
  }

  resUtil(ctx, 200, missions);
};
