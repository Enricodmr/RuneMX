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

// variaveis para ativar o botão de cadastro
var v_usu = 0;
var v_email = 0;
var v_senha = 0;
var v_conf = 0;
// função de validar usuário
function validarUsuario() {
    campo_vazio();
    var usu = ipt_usuario.value;
  
    if (usu == '') {
        erro_usu.innerHTML = ``;
      v_usu = 0
    } else if (usu.length < 8) {
      erro_usu.innerHTML = `Usuário deve conter ao menos 8 caracteres`;
      v_usu = 0
    } else {
      erro_usu.innerHTML = ``;
      v_usu = 1
    }
    liberar()
  }

  // função de validar email

  function validarEmail() {
    campo_vazio();
    var email = ipt_email.value;
    var arroba = email.indexOf('@');
    var com = email.indexOf('.com');
  
    if (email == '') {
        erro_email.innerHTML = ``;
      v_email = 0
    } else if (arroba == -1 && com == -1) {
      erro_email.innerHTML = `Email inválido (tem que possuir @ e .com)`;
      v_email = 0
    } else if (arroba == -1 && com != -1) {
      erro_email.innerHTML = `Email inválido (tem que possuir @)`;
      v_email = 0
    } else if (arroba != -1 && com == -1) {
      erro_email.innerHTML = `Email inválido (tem que possuir .com)`;
      v_email = 0
    } else if (com < arroba) {
      erro_email.innerHTML = `Email inválido (tem que possuir .com após o @)`;
      v_email = 0
    } else if (com - arroba == 1) {
      erro_email.innerHTML = `Email inválido (sem domínio após o @)`;
      v_email = 0
    } else {
      erro_email.innerHTML = ``;
      v_email = 1
    }
    liberar()
}

    //validação de senha
    function validarSenha() {
        campo_vazio();
        var senha = ipt_senha.value;
        var especial = [';', ':', '.', ',', '?', '!', "'", '"', '`', '~', '$', '%', '@', '#', '*', '&', '^', '_', '-', '+', '=', '\\', '/', '|',
          '(', ')', '[', ']', '{', '}', '<', '>', '±', '§', '♥', '÷', '×', '®', '©', '°'];
        var num = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        var senha_upper = senha.toUpperCase();
        var senha_lower = senha.toLowerCase();
        var c_especial = 0;
        var c_num = 0;
      
        // Verificar se a senha contém pelo menos um caractere especial
        for (var i = 0; i < especial.length; i++) {
          if (senha.includes(especial[i])) {
            c_especial = 1;
          }
        }
      
        // Verificar se a senha contém pelo menos um número
        for (var i = 0; i < num.length; i++) {
          if (senha.includes(num[i])) {
            c_num = 1;
          }
        }
      
        if (senha == '') {
          erro_senha.innerHTML = ``;
        } else if (senha.length < 8) {
          erro_senha.innerHTML = `A senha deve conter ao menos 8 caracteres`;
          v_senha = 0
        } else if (c_especial == 0 && c_num == 0) {
          erro_senha.innerHTML = `A senha deve conter ao menos um caractere especial e um número`;
          v_senha = 0
        } else if (c_especial == 0) {
          erro_senha.innerHTML = `A senha deve conter ao menos um caractere especial`;
          v_senha = 0
        } else if (c_num == 0) {
          erro_senha.innerHTML = `A senha deve conter ao menos um número`;
          v_senha = 0
        } else if (senha_upper == senha) {
          erro_senha.innerHTML = `A senha precisa conter ao menos um caractere minúsculo`;
          v_senha = 0
        } else if (senha_lower == senha) {
          erro_senha.innerHTML = `A senha precisa conter ao menos um caractere maiúsculo`;
          v_senha = 0
        } else {
          erro_senha.innerHTML = ``;
          v_senha = 1
        }
        liberar()
      }
//validação de confirmação de senha
  function validarConfirmacaoSenha() {
    campo_vazio();
    var senha = ipt_senha.value;
    var senha_confirmada = senha_conf.value;
  
    if (senha_confirmada == '') {
      erro_confirma.innerHTML = ``;
       v_conf = 0;
    } else if (senha_confirmada !== senha) {
      erro_confirma.innerHTML = `As senhas não coincidem`;
       v_conf = 0;
    } else {
      erro_confirma.innerHTML = ``;
       v_conf = 1;
    }
    liberar()
  }

  function campo_vazio(){
    var usu = ipt_usuario.value;
    var email = ipt_email.value;
    var senha = ipt_senha.value;
    var senha_confirmada = senha_conf.value;


    if(usu == '' || email == '' || senha == '' || senha_confirmada == ''){
        div_vazio.innerHTML = 'Todos os campos devem estar preenchidos'
    }else{
        div_vazio.innerHTML = ''
    }
  }

  // função de liberar o botão para cadastro
  function liberar(){
    if(v_usu == 0 || v_email == 0 || v_senha == 0 || v_conf == 0){
        btn_cadastro.disabled = true
    }else{
        btn_cadastro.disabled = false
    }
  }