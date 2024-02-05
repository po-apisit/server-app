const Router = require("express").Router();


Router.use("/customer", require("./Unauthorized/CucstomerRouter"))

module.exports = Router;