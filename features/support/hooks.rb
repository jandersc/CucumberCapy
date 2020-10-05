Before do #inserir o as variáveis para todo o projeto
    @login_page = LoginPage.new
    @movie_page = MoviePage.new
    @sidebar = SideBarView.new

    page.current_window.resize_to(1440, 900) #defini a resolução minima para execução dos testes
end

Before("@login") do
    #pega os dados do arquivo de configuração de ambiente
    user = CONFIG["users"]["cat_manager"]
    @login_page.go
    @login_page.with(user["email"], user["pass"])
end