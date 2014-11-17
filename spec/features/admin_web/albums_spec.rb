require 'rails_helper'

feature AdminWeb::Album do
  background do
    sign_in
  end

  scenario "create, update and destroy a institucional" do
    click_link 'Álbuns'

    expect(page).to have_content 'Cadastro de álbuns'

    click_link 'Novo'

    fill_in 'Título', with: "Álbum 1"
    fill_in 'Local', with: "Local Álbum 1"
    fill_in 'Data', with: I18n.l(Date.current)

    click_button 'Salvar'

    expect(page).to have_content "Cadastro realizado com sucesso"

    expect(page).to have_content "Álbum 1"
    expect(page).to have_content "Local Álbum 1"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Álbum 1'

    expect(page).to have_field "Título", with: "Álbum 1"
    expect(page).to have_field "Local", with: "Local Álbum 1"
    expect(page).to have_field "Data", with: I18n.l(Date.current)

    fill_in 'Título', with: "Alterando o álbum 1"
    fill_in 'Local', with: "Alterando o Local Álbum 1"
    fill_in 'Data', with: I18n.l(Date.current + 3.day)

    click_button "Salvar"

    expect(page).to have_content "Alteração realizada com sucesso"

    expect(page).to have_content "Alterando o álbum 1"
    expect(page).to have_content "Alterando o Local Álbum 1"
    expect(page).to have_content I18n.l(Date.current + 3.day)

    click_link 'Alterando o álbum 1'

    expect(page).to have_field "Título", with: "Alterando o álbum 1"
    expect(page).to have_field "Local", with: "Alterando o Local Álbum 1"
    expect(page).to have_field "Data", with: I18n.l(Date.current + 3.day)

    click_link 'Apagar'

    expect(page).to have_content "Registro excluído com sucesso"
  end
end
