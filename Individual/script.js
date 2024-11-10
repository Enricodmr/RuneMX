var API_key = "RGAPI-00330c3b-0954-4efe-8583-a8ff319ebc59";
var summoner_name = "";
var america_url = 'https://americas.api.riotgames.com'

function pesquisar(){
    
    var nick = ipt_invocador.value;
    var resultado = nick.split('#', 2);
    console.log(resultado)
    buscaDados(resultado);
    
}

async function buscaDados(resultado) {
    var acc_1_url = '/riot/account/v1/accounts/by-riot-id'
    var full_url = `${america_url}${acc_1_url}/${resultado[0]}/${resultado[1]}?api_key=${API_key}`
    const resposta = await fetch(full_url);
    const dados = await resposta.json();
    console.log(dados);
}

