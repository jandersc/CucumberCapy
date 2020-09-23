Dado('que {string} é um novo filme') do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/movies.yaml')) #procurar o arquivo yaml na raiz do cucumber
    @movie = file[movie_code]
end
  
Quando('eu faço o cadastro deste filme') do
    @movie_page.add
    @movie_page.create(@movie)
    #sleep 3
end
  
Então('devo ver o novo filme na lista') do
    #compara se o retorno da tabela está igual ao arquivo YAML
    resultado = @movie_page.movie_tr(@movie)
    expect(resultado).to have_text @movie["title"]
    expect(resultado).to have_text @movie["status"]
end

Então('devo ver a notificação {string}') do |expect_alert|
    expect(@movie_page.alert).to eql expect_alert
end