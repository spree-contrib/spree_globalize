module Spree
  RSpec.describe ProductsController, type: :controller do
    let!(:product) { create(:product) }

    before do
      SpreeI18n::Config.available_locales = [:'pt-BR']
    end

    context "visit non translated product page via permalink on url" do
      it "displays pages successfully" do
        spree_get :show, id: product.slug, locale: 'pt-BR'
        expect(response).to be_success
      end
    end
  end
end
