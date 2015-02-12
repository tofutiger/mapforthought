class UserController < ApplicationController
  def index
     @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @location = Location.new
  end

  def new
    @user = User.new
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
      redirect_to(:action => 'index')
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
      params.require(:user).permit(:name, :email)
    end

end
