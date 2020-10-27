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

After do |scenario|
    #if scenario.failed?  #usado para tirar print apenas quando o cenário falhar
    temp_shot = page.save_screenshot("log/temp_shot.png") #adiciona na variável o print da ultima tela do cenário
    screenshot = Base64.encode64(File.open(temp_shot, "rb").read) #converte a imagem e armazena em uma nova variável
    embed(screenshot, "image/png", "Screenshot") #anexa os prints no relatório
    #end
end