require 'rails_helper'

feature 'Admin register carrier' do
  scenario 'success' do
    admin = create(:admin)
    login_as(admin, scope: :admin)

    visit root_path
    click_on 'Cadastrar transportadora'
    fill_in 'Nome fantasia', with: 'Zona oeste courier'
    fill_in 'CNPJ', with: '82.676.748/0001-73'
    fill_in 'Razão social', with: 'Carlos Silva Transportes LTDA'
    fill_in 'Endereço', with: 'Av. Raimundo Pereira de Magalhaes, 132, 
                                São Paulo, SP'
    click_on 'Confirmar registro'


    expect(page).to have_content('Transportadora cadastrada com sucesso')
    expect(page).to have_content('Transportadora: Zona oeste courier')
    expect(page).to have_content('CNPJ: 82.676.748/0001-73')
    expect(page).to have_content('Razão Social: Carlos Silva Transportes LTDA')
    expect(page).to have_content('Endereço: Av. Raimundo Pereira de Magalhaes, 132, São Paulo, SP')
    expect(page).to have_link('Voltar')
  end
end
