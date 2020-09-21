Quando('eu faço login com {string} e {string}') do |email, password|          
    @login_page.go
    @login_page.with(email, password)
  end                                                                           
                                                                                
Então('devo ser autenticado') do                                              
    expect(get_token.length).to be 147 #comparando se de fato o token tem 147 caracteres (padrão dos tokens nflix) 
  end                                                                           
                                                                                
Então('devo ver {string} na área logada') do |expect_name| 
    expect(@sidebar.logged_user).to eql expect_name #compara se corresponde com o valor passado na feature
  end                                                                           

Então('não devo ser autenticado') do
    expect(get_token).to be nil #comparando se o token é igual a null que em ruby usa nil
end
  
Então('devo ver a mensagem de alerta {string}') do |msg_alerta|
    expect(@login_page.alert).to eql msg_alerta #compara se corresponde com o valor passado na feature
end