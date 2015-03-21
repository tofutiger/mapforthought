class UserController < ApplicationController
  
 before_action :authenticate_user!

  def index
     @users = User.all
     
  end

  #def map
    # @users = User.all
  #end

  def demo
    @users = User.all
  end
    
  def show
    @user = User.find(params[:id])
   # @trip_images = @user.trip_images
   
  end
 
  def new
    @user = User.new
    #2.times { @user.locations.build}
    
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      
        redirect_to(:action => 'index')
      
    else
      render('new')
    end
  end


  def edit
    @user = User.find(params[:id])
    
  
  end

  def update
    @user = User.find(params[:id])
   
    if @user.update_attributes(user_params)
      render('show')
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

 private

    def user_params
      params.require(:user).permit(:name, :email, :description, :provider, :username, :password, :scholarships, :avatar, :trip_images, :locations_id, :photo, locations_attributes: [:id, :address])
    end

end
