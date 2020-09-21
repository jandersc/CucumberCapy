class MoviePage
    include Capybara::DSL

    def add
        find(".nc-simple-add").click
    end

    def create(title, status)
        find('input[name=title]').set title
        find('input[placeholder=Status]').click
        find(".el-select-dropdown__item select-primary").set status

    end
end
