class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort]=="price" && params[:order]=="asc"
      @products = Product.order(params[:sort] => params[:order])
    end
    if params[:sort]=="price" && params[:order]=="desc"
      @products = Product.order(params[:sort] => params[:order])
    end
    if params[:discount] == "true"
      @products= Product.where("price > ?", 100)
    end
  end
  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(name: params[:name], price: params[:name], image: params[:image], description: params[:description])
    @product.save

    flash[:success] = "#{@product.name} was successfully created."

    redirect_to "products/#{@product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
    name: params[:name],
    price: params[:price],
    image: params[:image],
     description: params[:description]
     )
     flash[:success] = "#{@product.name} was successfully updated."
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy(
    name: params[:name],
    price: params[:price],
    image: params[:image],
    description: params[:description]
    )
    flash[:success] = "#{@product.name} was successfully deleted."
    redirect_to "products"
  end
end
