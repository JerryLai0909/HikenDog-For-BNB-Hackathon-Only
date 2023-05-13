const fs = require('fs')
const path = require('path')
const basename = path.basename(module.filename)
let controllers = {}

autoLoadFile(controllers, __dirname)

function autoLoadFile(parent, file_path) {
  fs.readdirSync(file_path).filter(function (file) {
    let stat = fs.lstatSync(`${file_path}/${file}`)
    if (stat.isDirectory()) {
      parent[file] = {}
      autoLoadFile(parent[file], `${file_path}/${file}`)
    }
    return (file.indexOf('.') !== 0) && (file !== basename) && (file.slice(-3) === '.js')
  }).forEach(function (file) {
    let model = require(path.join(file_path, file))
    parent[file.split('.js')[0]] = model
  })
}

module.exports = controllers