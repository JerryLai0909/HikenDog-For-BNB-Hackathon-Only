const jsonresult = require('../../config/res_result')

class JsonResult {
    constructor(code) {
        this.code = code
    }

    jsonReuslt() {
        return jsonresult.resultEume[this.code]
    }
}

/**
 * 返回的json格式
 * @param ctx    必传
 * @param code   错误码，详情见 config.http_result
 * @param data   数据
 * @param customMsg  如果传了这个参数，会替代 config.http_result 的返回msg
 * @returns {{rv: *, msg: string, data: *}}
 */
exports.resUtil = function (ctx, code, data, customMsg) {
    let msg = ''
    if (customMsg !== null && customMsg !== '' && customMsg !== undefined) {
        msg = customMsg
    } else {
        let result = new JsonResult(code)
        msg = result.jsonReuslt()
    }
    return ctx.body = {
        code: code,
        msg: msg,
        data: data
    }
}
