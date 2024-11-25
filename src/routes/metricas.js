var express = require("express");
var router = express.Router();

var metricasController = require("../controllers/metricasController");

router.get("/buscarPontuacao", function (req, res) {
    metricasController.buscarPontuacao(req, res);
});


module.exports = router;