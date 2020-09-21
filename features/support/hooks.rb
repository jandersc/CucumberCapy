Before do #inserir o as variáveis para todo o projeto
    @login_page = LoginPage.new
    @movie_page = MoviePage.new
    @sidebar = SideBarView.new
end

Before("@login") do
    @login_page.go
    @login_page.with("tony@stark.com", "pwd123")
end