class MoviePage
    include Capybara::DSL

    def add
        find(".nc-simple-add").click
    end

    def create(movie)
        find('input[name=title]').set movie["title"]
        
        #combobox
        find('input[placeholder=Status]').click
        find(".el-select-dropdown__item", text: movie["status"]).click

        find('input[name=year]').set movie["year"]

        find('input[name=release_date]').set movie["release_date"]

        actor = find(".input-new-tag")
        movie['cast'].each do |a|
            actor.set a
            actor.send_keys :tab
        end
    end
end
