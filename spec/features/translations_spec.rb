# encoding: utf-8
RSpec.feature "Translations" do
  before do
    Spree::Store.update_all(default_locale: 'pt-BR')
  end

  context 'product' do
    let!(:store) { create(:store, default: true, default_locale: 'pt-BR', supported_locales: 'pt-BR', url:'http://www.example.com') }
    let!(:product) do
      create(:product,
        name: 'Antimatter',
        meta_title: 'Antimatter meta_title',
        meta_description: 'Antimatter meta_description',
        translations: [
          Spree::Product::Translation.new(
            locale: 'pt-BR',
            name: 'Antimatéria',
            meta_title: 'Antimatéria meta_title',
            meta_description: 'Antimatéria meta_description'
          )
        ]
      )
    end

    scenario 'displays translated product page', js: true do
      visit '/products/antimatter'
      expect(page.title).to have_content('Antimatéria')
    end

    scenario 'displays translated products list', js: true do
      visit '/products'
      expect(page).to have_content('Antimatéria')
    end
  end
end
