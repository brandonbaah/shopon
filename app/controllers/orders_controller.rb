class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def create
    @order = Order.new(
    quantity: params[:quantity],
    product_id: params[:product_id],
    user_id: current_user.id,
    subtotal: params[:subtotal],
    tax: params[:tax],
    total: params[:total]
    )
    order.subtotal = params[:quantity] * order.product.price
    order.tax = 0.09 * order.subtotal
    order.total = order.subtotal + order.tax
    @order.save
    flash[:success] = "You successfully purchased your desired items."
    redirect_to "/orders/#{@order.id}"
  end

end
