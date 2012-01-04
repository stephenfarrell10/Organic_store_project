class SessionsController < ApplicationController
 #@ reference wesley gorman laptop_shop 2 tutorial,step  36
 def create

  if user = User.authenticate(params[:email], params[:password])
 session[:user_id] = user.id
  redirect_to products_path, :notice => "Logged in successfully"
 else
   flash.now[:alert] = "wrong login credentials"


render :new
 end
end
def destroy

 #@ reference wesley gorman laptop_shop 2 tutorial,step  36

     reset_session

 redirect_to "/welcome/thank_you", notice: "logged out"
 #redirect_to "/admin/index", :notice=>'logged out'

 end
end

