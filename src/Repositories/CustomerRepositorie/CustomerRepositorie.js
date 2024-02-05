const db = require("../../Connection/models")

exports.fildall = async () => await db.User.findAll();