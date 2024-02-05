const CustomerService = require("../../Service/CustomerService/CustomerService");

exports.findAll = async (req, res) => {

    const result = await CustomerService.findAll(); 

    if(result != null)
    {
        res.json({ result : "OK", message: result });
    } else {
        res.json({ result : "NOK", message: [] });
    }
}