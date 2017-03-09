class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    #return redirect_to new_user_path unless user.save
    if !@user.save
      flash[:notice] = "LOCK YOUR DOOR, STUPID"
      return redirect_to new_user_path
    end
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
