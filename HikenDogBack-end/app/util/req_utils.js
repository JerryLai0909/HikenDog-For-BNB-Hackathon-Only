const models = require('../models')
const Sequelize = require('sequelize')


exports.qselect = async (sql, replacements) => {
    return await models.sequelize.query(sql, {
        replacements,
        type: Sequelize.QueryTypes.SELECT
    })
}

exports.qinsert = async (sql, replacements) => {
    return await models.sequelize.query(sql, {
        replacements,
        type: Sequelize.QueryTypes.INSERT
    })
}

exports.qupdate = async (sql, replacements) => {
    return await models.sequelize.query(sql, {
        replacements,
        type: Sequelize.QueryTypes.UPDATE
    })
}

exports.qdelete = async (sql, replacements) => {
    return await models.sequelize.query(sql, {
        replacements,
        type: Sequelize.QueryTypes.DELETE
    })
}
