require 'report_builder' #add a bibloteca do report_builder
require 'date' #add a biblioteca de data para DateTime.now

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

d = DateTime.now #chama o método para pegar hora atual   
@current_date = d.to_s.tr(':', '-') #troca os dois pontos por traço

at_exit do
    ReportBuilder.configure do |config|
        config.input_path = 'log/report.json'
        config.report_path = "log/" + @current_date
        config.report_types = [:html]
        config.report_title = 'NinjaFlix - WebApp'
        config.compress_image = true
        config.additional_info = {'App' => 'Web', 'Data de Execução' => @current_date}
        config.color = 'indigo'
    end
    ReportBuilder.build_report 
end