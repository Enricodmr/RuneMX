var respostaModel = require("../models/respostaModel");

function listar_ultimos(req, res) {
    console.log(res)
    const idAviso = req.params.idAviso;

    if(idAviso == undefined || idAviso == null) {
        res.status(400).send("IdAviso está undefined!")
    }
    respostaModel.listar_ultimos(idAviso).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function publicar(req, res) {
    var descricao = req.body.descricao;
    var idUsuario = req.params.idUsuario;
    var idAviso = req.params.idAviso;
 
    console.log(descricao, idUsuario, idAviso)

    if (descricao == undefined) {
        res.status(400).send("A descrição está indefinido!");
    } else if (idUsuario == undefined) {
        res.status(403).send("O id do usuário está indefinido!");
    } else if(idAviso == undefined){
        res.status(403).send("O post está indefinido!")
    } else {
        respostaModel.publicar(descricao, idUsuario ,idAviso)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            )
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    listar_ultimos,
    publicar
}