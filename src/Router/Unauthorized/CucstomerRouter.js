const Router = require("express").Router()
const CustomerController = require("../../Controllers/CustomerController/CustomerController")

Router.get("/", CustomerController.findAll)

module.exports = Router;