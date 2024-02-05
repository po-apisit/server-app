const Router = require("express").Router();

Router.get("/all", ( req, res) => {
    res.json({hello:"Hello world"});
})


module.exports = Router;