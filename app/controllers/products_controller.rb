class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end
  
  def dumbbells
  end

  def telescope
  end

  def pullup_bar
  end

  def iphone
  end

  def sofa
  end

  def new_product
    Product.create(
    name: params[:name],
    price: params[:price],
    image: params[:image],
     description: params[:description]
     )
     render "new_product.html.erb"
  end

end
