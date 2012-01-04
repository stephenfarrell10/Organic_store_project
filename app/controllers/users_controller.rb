class UsersController < ApplicationController
#before_filter :authenticate, :only => [:index, :edit, :update]


 def update
     @user=User.find(params[id])
    @user.update_attributes(params[:user])
           flash[:notice] = " "

           redirect_to(@user,:notice => 'updated')

     end

   def new
    @user= User.new

  end


  def show
 @user=User.find(params[:id])

  end

  def index
      @users = User.find(:all)

    end

 def edit
   @user = User.find(params[:id])
 end



 	def destroy
         @user = User.find(params[:id])
         @user.destroy
         flash[:notice] = "User deleted"
         redirect_to users_path
       end




#@ reference wesley gorman,laptop_shop 2 tutorial, step 12

   def create
@user = User.new(params[:user])
if @user.save
redirect_to products_path, :notice => 'User creation successful!, dont forget to login'
else
render :action => 'new'
end
    end
  end

