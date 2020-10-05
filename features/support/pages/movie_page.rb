class MoviePage #nova classe para a página Movie
    include Capybara::DSL #incluindo o capybara ao arquivo

    def initialize
        @movie_list_css = "table tbody tr"
    end
    
    def form
        MovieAdd.new
    end

    def sweet_alert
        SweetAlert.new
    end
    
    def add #metódo que clica no botão + para add um novo filme
        find(".movie-add").click
    end

    #metódo que procura os elementos da tabela com base nos titulos
    def movie_tr(title)
      find(@movie_list_css, text: title)  
    end

    def remove(title)
        #método para localizar o botão de excluir na linha que tem o titulo da pesquisa
        movie_tr(title).find(".btn-trash").click
    end

    def has_no_movie(title)
        #has_no_css? para confirmar se não existe mais a linha na tabela 
        page.has_no_css?(@movie_list_css, text: title)
    end

    def has_movie(title)
        #has_no_css? para confirmar se não existe mais a linha na tabela 
        page.has_css?(@movie_list_css, text: title)
    end
  
end
