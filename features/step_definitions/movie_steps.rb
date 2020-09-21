Dado('que {string} é um novo filme') do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/movies.yaml')) #procurar o arquivo yaml na raiz do cucumber
    @movie = file[movie_code]
    #Kernel.puts @movie
  end
  
  Quando('eu faço o cadastro deste filme') do
    @movie_page.add
    @movie_page.create(@movie)
    sleep 3
  end
  
  Então('devo ver o novo filme na lista') do
    pending # Write code here that turns the phrase above into concrete actions
  end