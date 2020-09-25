#chama a gem do postgres
require "pg"

class Database
    def delete_movie(title)
        #conecta no banco de dados
        connection = PG.connect(host: "192.168.99.100", dbname: "ninjaflix", user: "postgres", password: "qaninja")
        #executa o script SQL
        connection.exec("DELETE from public.movies where title = '#{title}';")  
    end
end