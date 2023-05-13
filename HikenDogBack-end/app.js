const Koa = require('koa')
const mount = require('mount-koa-routes');
const moment = require('moment')
const koaBody = require('koa-body')


const app = new Koa()


app.use(koaBody({ multipart: true }));

app.use(async (ctx, next) => {
    const start = new Date()
    await next();
    const ms = new Date() - start
    console.log(`${ctx.method} ${ctx.url}<-${moment(start).format('YYYY-MM-DD HH:mm:ss')}->${ms}ms `)
});

mount(app, __dirname + '/app/routers', true)
module.exports = app
