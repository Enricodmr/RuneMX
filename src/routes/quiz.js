var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.get("/listarMediaPont", function (req, res) {
  quizController.listarMediaPont(req, res);
});

router.post("/cadastrarPontos", function (req, res) {
  quizController.cadastrarPontos(req, res);
});

module.exports = router;