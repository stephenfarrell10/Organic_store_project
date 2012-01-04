class ApplicationController < ActionController::Base
  protect_from_forgery

 protected
#@reference wesley gorman,laptop_shop 2 tutorial, step 39
def current_user
return unless session[:user_id]
@current_user ||= User.find_by_id(session[:user_id])
end

helper_method :current_user
 #@reference wesley gorman, laptop_shop 2 tutorial, step 39
def authenticate
logged_in? ? true : access_denied
end
 #@reference wesley gorman, laptop_shop 2 tutorial, step 39

def logged_in?
current_user.is_a? User
end
 #@reference wesley gorman, laptop_shop 2 tutorial, step 39

helper_method :logged_in?
def access_denied

end
# sam ruby, dave thomas, david heinemeier hanson, agile web development, chapter 9 , page 106, fourth edition
 private
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id]=cart.id
    cart
  end
end
