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

  def create
    @product = Product.new(name: params[:name], price: params[:name], image: params[:image], description: params[:description])
    @product.save
    render "create.html.erb"
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
    redirect "update.html.erb"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy(
    name: params[:name],
    price: params[:price],
    image: params[:image],
    description: params[:description]
    )
    render "destroy.html.erb"
  end

end
