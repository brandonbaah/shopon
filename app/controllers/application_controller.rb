class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #
  protect_from_forgery with: :exception
  before_action :calculate_cart_count

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
    helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authorize_admin!
    unless current_user && current_user.admin
      flash[:warning] = "Not Authorized"
      redirect_to '/products'
    end
  end

  def calculate_cart_count
    if session[:cart_count].nil?
    @cart_count = current_user.carted_products.where(status: 'carted').size
    session[:cart_count] = @cart_count
  elsif
    @cart_count = session[:cart_count]
    end
  end
end
