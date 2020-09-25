module Helpers #o modulo é utilizado para criar métodos que podem ser utilizados por todas as páginas sem precisar chamar um nova instancia

    def get_token
        timeout = Capybara.default_max_wait_time #usado para resolver o problema da chave vazia do chrome
        timeout.times do
            js_script = 'return window.localStorage.getItem("default_auth_token");' #variável com um script para retornar o número do token
            @token = page.execute_script(js_script) #executando o javascript 
            sleep 1
        end
        @token
    end
end