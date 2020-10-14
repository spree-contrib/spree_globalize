# encoding: utf-8
RSpec.feature "Translations" do
  background do
    reset_spree_preferences
    SpreeI18n::Config.available_locales = [:en, :'pt-BR']
    SpreeGlobalize::Config.supported_locales = [:en, :'pt-BR']
  end

  context 'product' do
    let!(:store) { create(:store) }
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

    before do
      I18n.locale = 'pt-BR'
      Spree::Frontend::Config[:locale] = 'pt-BR'
    end

    scenario 'displays translated product page' do
      visit '/pt-BR/products/antimatter'
      expect(page.title).to have_content('Antimatéria')
    end

    scenario 'displays translated products list' do
      visit '/pt-BR/products'
      expect(page).to have_content('Antimatéria')
    end

    after do
      I18n.locale = :en
      Spree::Frontend::Config[:locale] = :en
    end
  end
end
