class OrdersController < ApplicationController
  before_action: :authenticate_user

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "purchased")
    if @carted_products.status == "purchased"
    else
      redirect_to "/products"
      flash[:warning] = "Sorry. There is currently no items in your cart."
      redirect_to "/products"
    end
    render 'show.html.erb'
  end

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    @order = Order.new(
    user_id: current_user.id,
    )
    # @order.tax = 0.09 * @order.subtotal
    # @order.total = @order.subtotal + @order.tax

    @order.save
    subtotal = 0
    @carted_products.each do |carted_product|
      carted_product.update(status: "purchased")
      carted_product.update(order_id: @order.id)
      subtotal = carted_product.quantity * carted_product.product.price
    end

    @order.subtotal = subtotal
    @order.tax = 0.09 * subtotal
    @order.total = @order.subtotal + @order.tax
    @order.save

    flash[:success] = "You successfully purchased your desired items."

    redirect_to "/orders/#{@order.id}"
  end

end
