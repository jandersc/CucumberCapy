class SideBarView
    include Capybara::DSL

    def logged_user
        find('.sidebar-wrapper .user .info span').text  #localizar a div correta onde fica o nome do usuário
    end

end