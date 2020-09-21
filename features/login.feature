#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuário previamente cadastrado 
    Posso acessar o sistem com o meu email e senha

    @login_happy
    Cenario: Acesso
        Quando eu faço login com "tony@stark.com" e "pwd123"
        Então devo ser autenticado
        E devo ver "Tony Stark" na área logada

    @login_hapless
    Esquema do Cenario: Login sem sucesso
        Quando eu faço login com <email> e <senha>
        Então não devo ser autenticado
        E devo ver a mensagem de alerta <texto>    

        Exemplos:
        | email                        | senha   | texto                          |
        | "tony@stark.com"             | "pwd12" | "Usuário e/ou senha inválidos" |
        | "jander.cerqueira@gmail.com" | "pwd123"| "Usuário e/ou senha inválidos" |
        | ""                           | "pwd123"| "Opps. Cadê o email?"          |
        | "tony@stark.com"             | ""      | "Opps. Cadê a senha?"          |