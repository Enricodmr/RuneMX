var database = require("../database/config");

function listar_ultimos(idAviso) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucaoSql = `
   SELECT 
            r.idResposta AS 'id resposta',
            r.descricao,
            u.id AS'id Usuario',
            u.nome,
            u.email,
            u.senha
        FROM resposta r
            INNER JOIN usuario u
                ON r.fkUsuario = u.id WHERE fkPost = ${idAviso}
                    ORDER BY r.idResposta ASC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function publicar(descricao, idUsuario, idAviso) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function publicar(): ",descricao, idUsuario, idAviso);
    var instrucaoSql = `
        INSERT INTO resposta (descricao, fkUsuario, fkPost) VALUES ('${descricao}', ${idUsuario}, ${idAviso});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listar_ultimos,
    publicar
}