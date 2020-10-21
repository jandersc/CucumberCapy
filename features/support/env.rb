require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require_relative "helpers"

World(Helpers)

#passa o caminho do arquivo onde tem a url do ambiente, variável em caixa alta para ser usada em todo o projeto
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

#atribuindo as configurações de navagador na variável utilizando o case
case ENV["BROWSER"]
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :selenium_chrome
when "headless"
    @driver = :selenium_chrome_headless
else
    puts "Invalid Browser"
end

Capybara.configure do |config| #configurações do Capybara
    config.default_driver = @driver #usando a variável que foi definida a cima :selenium_chrome #definindo o Chrome como navegador padrão
    config.app_host = CONFIG["url"] #passa o caminho que foi alterado na variável 
    config.default_max_wait_time = 10
end