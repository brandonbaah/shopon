class CartedProductsController < ApplicationController
before_action :authenticate_user!
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    if @carted_products.empty?
      flash[:warning] = "Sorry. There is currently no items in your cart."
      redirect_to "/products"
    else
    render "index.html.erb"
  end
end
  # Modify all the rows from the carted_products table so that
  # their status changes to “purchased” and that they are given the appropriate order_id.
  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def create
    @carted_product = CartedProduct.new(
    user_id: session[:user_id],
    product_id: params[:product_id],
    quantity: params[:quantity],
    status: "carted"
    )
    @carted_product.save
    flash[:success] = "You successfully carted your desired items."
    redirect_to "/checkout/#{@carted_product.id}"
  end
    # flash[:success] = "You successfully carted your desired items."

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    redirect_to '/checkout'
    end
  end
