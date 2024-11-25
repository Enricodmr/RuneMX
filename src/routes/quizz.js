var express = require("express");
var router = express.Router();

var quizzController = require("../controllers/quizzController");

router.get("/listarMediaPont", function (req, res) {
  quizzController.listarMediaPont(req, res);
});

router.post("/cadastrarPontos", function (req, res) {
  quizzController.cadastrarPontos(req, res);
});


module.exports = router;