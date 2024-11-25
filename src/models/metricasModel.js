var database = require("../database/config");

function buscarPontuacao() {

    //select que mostra a quantidade de pessoas que tiveram a pontuação
    var instrucaoSql = `
        select (select count(qtdPontos) as 'Até 5' from quiz where qtdPontos <= 5) as ate_5, 
        (select count(qtdPontos) as '5 a 11' from quiz where qtdPontos >5 and qtdPontos <= 11) as de5_a_11, 
        (select count(qtdPontos) as '11 a 14' from quiz where qtdPontos > 11 and qtdPontos <=14) as de11_a_14,
        (select count(qtdPontos) as '15' from quiz where qtdPontos = 15) as ate_15 from quiz limit 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarPontuacao
}