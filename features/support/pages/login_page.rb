class LoginPage #Page Object para o login
    include Capybara::DSL #incluindo a biblioteca capybara 

    def go
        visit "/" #visita a página inicial as definições do endereço estão no support/env.rb
    end

    def with(email, pass)
        find('input[name=email]').set email #localizando o campo email e passando o email da feature
        find('input[name=password]').set pass #localizando o campo senha e passando a senha da feature
        click_button "Entrar" #clicando no botão entrar
    end

    def alert
        find('.alert').text #localizar a div correta onde fica a mensagem de alerta
    end
end