require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require_relative "helpers"

World(Helpers)

Capybara.configure do |config| #configurações do Capybara
    config.default_driver = :selenium_chrome #definindo o Chrome como navegador padrão
    config.app_host = "http://192.168.99.100:8080" #docker toolbox no windows
end