class ProductsController < ApplicationController

  before_filter :find_all_products
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end

  def show
    @product = Product.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end
  
  def confirm
    product_id     = params[:referenceId].split('-').last
    @product       = Product.find(product_id)
    transaction_id = params[:transactionId]
    
    
    if @product.update_attributes!(:transaction_id => transaction_id, :purchased => true)
      redirect_to(@product, :notice => "Thank you for your purchase. Your transaction ID is: ##{transaction_id}")
    else
      redirect_to :action => :index
    end
  end

protected

  def find_all_products
    @products = Product.published.order("purchased DESC, position")
  end

  def find_page
    @page = Page.find_by_link_url("/products")
  end

end
