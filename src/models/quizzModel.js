var database = require("../database/config");

function listarMediaPont() {
  console.log("ACESSEI O QUIZ  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
var instrucao = `
  select truncate(avg(qtdPontos),0) AS MediaPontuacao from quiz;
`;
console.log("Executando a instrução SQL: \n" + instrucao);
return database.executar(instrucao);
}

function cadastrarPontos(pontos, idUsuario) {
  var instrucao = `
    INSERT INTO quiz (qtdPontos, fk_usuario) VALUES (${pontos}, ${idUsuario});
  `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

module.exports = {
  cadastrarPontos,
  listarMediaPont
};