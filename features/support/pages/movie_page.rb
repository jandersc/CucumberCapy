class MoviePage
    include Capybara::DSL

    def add
        find(".nc-simple-add").click
    end

    def create(movie)
        find('input[name=title]').set movie["title"]
        
        #combobox
        find('input[placeholder=Status]').click
        find(".el-select-dropdown__item", text: movie["status"].click

    end
end
