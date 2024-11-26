var express = require("express");
var router = express.Router();

var respostaController = require("../controllers/respostaController.js");

router.get("/listar_ultimos/:idAviso", function (req, res) {
    respostaController.listar_ultimos(req, res);
});

router.post("/publicar/:idAviso/:idUsuario", function (req, res) {
    respostaController.publicar(req, res);
});

module.exports = router;