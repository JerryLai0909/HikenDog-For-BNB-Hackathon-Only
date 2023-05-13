
const qutil = require('../util/req_utils')
const { resUtil } = require('../util/res_utils')



exports.getMainInfoData = async (ctx, next) => {
    let reqBody = ctx.request.body
    console.log('111', reqBody)
    let sql = 'SELECT * FROM info_records'
    let data = await qutil.qselect(sql)
    resUtil(ctx, 200, data)
}


