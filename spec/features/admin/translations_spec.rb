RSpec.feature "Translations", :js do
  stub_authorization!

  given(:language) { Spree.t(:this_file_language, scope: 'i18n', locale: 'pt-BR') }
  given!(:store) { create(:store) }

  background do
    [:en, :'pt-BR'].each do |locale|
      create(:store, default_locale: locale)
    end
  end

  context "products" do
    given(:product) { create(:product) }

    context "fills in translations fields" do
      scenario "saves translated attributes properly" do
        visit spree.admin_product_path(product)
        click_on "Translations"

        within("#attr_fields .name.en") { fill_in_name "Pearl Jam" }
        within("#attr_fields .name.pt-BR") { fill_in_name "Geleia de perola" }
        click_on "Update"

        visit spree.admin_translations_path('products', product.id)
        select2 'Português (pt-BR)', from: 'Select locale'

        expect(page).to have_selector("input[value='Geleia de perola']")
      end
    end

    context "product properties" do
      given!(:product_property) { create(:product_property, value: "red") }

      xscenario "saves translated attributes properly" do
        visit spree.admin_product_product_properties_path(product_property.product)
        within_row(1) { click_icon :translate }

        within("#attr_fields .value.pt-BR") { fill_in_name "vermelho" }
        click_on "Update"
        visit spree.admin_product_product_properties_path(product_property.product)

        expect(page).to have_selector("input[value=vermelho]")
      end
    end

    context "option types" do
      given!(:option_type) { create(:option_value).option_type }

      scenario "saves translated attributes properly" do
        visit spree.admin_option_types_path
        within_row(1) { click_icon :translate }

        within("#attr_fields .name.en") { fill_in_name "shirt sizes" }
        within("#attr_list") { click_on "Presentation" }
        within("#attr_fields .presentation.en") { fill_in_name "size" }
        within("#attr_fields .presentation.pt-BR") { fill_in_name "tamanho" }
        click_on "Update"
        visit spree.admin_translations_path('option_types', option_type.id)
        select2 'Português (pt-BR)', from: 'Select locale'
        click_on 'Presentation'

        expect(page).to have_selector("input[value=tamanho]")
      end

      # Regression test for issue #354
      scenario "successfully creates an option type and go to its edit page" do
        visit spree.admin_option_types_path
        click_link "New Option Type"
        fill_in "Name", with: "Shirt Size"
        fill_in "Presentation", with: "Sizes"
        click_button "Create"

        expect(page).to have_text_like 'has been successfully created'
        expect(page).to have_text_like 'Option Values'
      end
    end

    context "option values" do
      given!(:option_type) { create(:option_value).option_type }

      scenario "saves translated attributes properly" do
        visit spree.admin_option_types_path
        within_row(1) { click_icon :translate }

        within("#attr_fields .name.en") { fill_in_name "big" }
        within("#attr_list") { click_on "Presentation" }
        within("#attr_fields .presentation.en") { fill_in_name "big" }
        within("#attr_fields .presentation.pt-BR") { fill_in_name "grande" }
        click_on "Update"

        visit spree.admin_translations_path('option_types', option_type.id)
        select2 'Português (pt-BR)', from: 'Select locale'
        click_on 'Presentation'

        expect(page).to have_selector("input[value=grande]")
      end
    end

    context "properties" do
      given!(:property) { create(:property) }

      scenario "saves translated attributes properly" do
        visit spree.admin_properties_path
        within_row(1) { click_icon :translate }

        within("#attr_fields .name.pt-BR") { fill_in_name "Modelo" }
        within("#attr_list") { click_on "Presentation" }
        within("#attr_fields .presentation.en") { fill_in_name "Model" }
        within("#attr_fields .presentation.pt-BR") { fill_in_name "Modelo" }
        click_on "Update"
        visit spree.admin_translations_path('properties', property.id)
        select2 'Português (pt-BR)', from: 'Select locale'

        expect(page).to have_selector("input[value=Modelo]")
      end
    end
  end

  context "promotions" do
    given!(:promotion) { create(:promotion) }

    scenario "saves translated attributes properly" do
      visit spree.admin_promotions_path
      within_row(1) { click_icon :translate }

      within("#attr_fields .name.en") { fill_in_name "All free" }
      within("#attr_fields .name.pt-BR") { fill_in_name "Salve salve" }
      click_on "Update"
      visit spree.admin_translations_path('promotions', promotion.id)
      select2 'Português (pt-BR)', from: 'Select locale'
      expect(page).to have_selector("input[value='Salve salve']")
    end

    it "render edit route properly" do
      visit spree.admin_promotions_path
      within_row(1) { click_icon :translate }
      click_on 'Cancel'

      expect(page).to have_css('.content-header')
    end
  end

  context "taxonomies" do
    given!(:taxonomy) { create(:taxonomy) }

    scenario "saves translated attributes properly" do
      visit spree.admin_taxonomies_path
      within_row(1) { click_icon :translate }

      within("#attr_fields .name.en") { fill_in_name "Guitars" }
      within("#attr_fields .name.pt-BR") { fill_in_name "Guitarras" }
      click_on "Update"

      visit spree.admin_translations_path('taxonomies', taxonomy.id)
      select2 'Português (pt-BR)', from: 'Select locale'

      expect(page).to have_selector("input[value=Guitarras]")
    end
  end

  context 'taxons' do
    given!(:taxonomy) { create(:taxonomy) }
    given!(:taxon) { create(:taxon, taxonomy: taxonomy, parent_id: taxonomy.root.id) }

    scenario "saves translated attributes properly" do
      visit spree.admin_translations_path('taxons', taxon.id)

      within("#attr_fields .name.en") { fill_in_name "Acoustic" }
      within("#attr_fields .name.pt-BR") { fill_in_name "Acusticas" }
      click_on "Update"

      visit spree.admin_translations_path('taxons', taxon.id)

      # ensure we're not duplicating translated records on database
      expect {
        click_on "Update"
      }.not_to change { taxon.translations.count }

      # ensure taxon is in root or it will not be visible
      expect(taxonomy.root.children.count).to be(1)

      visit spree.admin_translations_path('taxons', taxon.id)
      select2 'Português (pt-BR)', from: 'Select locale'

      expect(page).to have_selector("input[value=Acusticas]")
    end
  end

  context "shipping methods" do
    given(:shipping_category) { create(:shipping_category) }
    given!(:shipping_method) { create(:shipping_method, shipping_categories:[shipping_category]) }

    scenario 'saves translated attributes properly' do
      visit spree.admin_translations_path('shipping_methods', shipping_method.id)

      within("#attr_fields .name.en") { fill_in_name "Urgent elivery" }
      within("#attr_fields .name.pt-BR") { fill_in_name "Entrega urgente" }
      click_on "Update"

      visit spree.admin_translations_path('shipping_methods', shipping_method.id)
      select2 'Português (pt-BR)', from: 'Select locale'
      expect(page).to have_selector("input[value='Entrega urgente']")
    end

    it "render edit route properly" do
      visit spree.admin_shipping_methods_path
      within_row(1) { click_icon :translate }
      click_on 'Cancel'

      expect(page).to have_css('.content-header')
    end
  end

  context "permalink routing" do
    given(:language) { Spree.t(:this_file_language, scope: 'i18n', locale: 'de') }
    given(:product) { create(:product) }

    scenario "finds the right product with permalink in a not active language" do
      [:en, :de].each do |locale|
        create(:store, default_locale: locale)
      end

      visit spree.admin_product_path(product)
      click_on "Translations"
      click_on "Slug"
      within("#attr_fields .slug.en") { fill_in_name "en_link" }
      within("#attr_fields .slug.de") { fill_in_name "de_link" }
      click_on "Update"

      visit spree.product_path 'en_link'
      expect(page).to have_text_like 'Product'

      visit spree.product_path 'de_link'
      expect(page).to have_text_like 'Product'
    end
  end

  private

  def fill_in_name(value)
    fill_in first("input[type='text']")["name"], with: value
  end
end
