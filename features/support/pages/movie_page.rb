class MoviePage #nova classe para a página Movie
    include Capybara::DSL #incluindo o capybara ao arquivo

    def add #metódo que clica no botão + para add um novo filme
        find(".movie-add").click
    end

    def create(movie) #metódo que cria um novo filme pegando os valores do arquivo YAML
        
        #preenchendo o campo filme
        find('input[name=title]').set movie["title"]
        
        #preenche o combobox
        find('input[placeholder=Status]').click #necessário o click para habilitar os campos
        find(".el-select-dropdown__item", text: movie["status"]).click #seleciona o status do filme

        #preenche o ano de lançamento
        find('input[name=year]').set movie["year"] 

        #preenche a data de lançamento
        find('input[name=release_date]').set movie["release_date"]

        #seleciona os atores
        actor = find(".input-new-tag") #atribuindo a variável o campo de ator
        movie['cast'].each do |a| #ler o array do arquivo e atribui a variável 
            actor.set a #altera o campo com valor da variável
            actor.send_keys :tab #TAB para add o próximo ator do array
        end

        #preenche o campo com a sinopse do filme 
        find('textarea[name=overview]').set movie["overview"]

        #procurar o diretório onde tá a imagem e atribui a variável
        cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + movie["cover"])

        #comando para o Capybara ingnorar os elementos desabilitados (o elemento "upcover está desabilitado")
        Capybara.ignore_hidden_elements = false

        #adiciona o arquivo ao elemento de upload de imagem 
        attach_file('upcover', cover_file)
        
        #comando para voltar a considerar os elementos desabilitados.
        Capybara.ignore_hidden_elements = true

        #clicar no botão cadastrar
        find("#create-movie").click
    end

    #metódo que procura os elementos da tabela com base nos titulos
    def movie_tr(movie)
      find('table tbody tr', text: movie["title"])  
    end
end
