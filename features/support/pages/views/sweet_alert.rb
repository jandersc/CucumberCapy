class SweetAlert #nova classe para a página Movie
    include Capybara::DSL #incluindo o capybara ao arquivo

    def confirm
        find(".swal2-confirm").click
    end

    def cancel
        find(".swal2-cancel").click
    end

end