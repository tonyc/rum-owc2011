module Admin
  class ProductsController < Admin::BaseController

    crudify :product,
            :title_attribute => 'name'

    def index
      search_all_products if searching?
      paginate_all_products

      render :partial => 'products' if request.xhr?
    end

  end
end
