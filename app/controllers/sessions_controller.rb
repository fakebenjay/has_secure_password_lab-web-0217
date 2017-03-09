class SessionsController < ApplicationController
  def new
    @user = User.new
    return redirect_to '/' unless logged_out?
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authentication = @user.try(:authenticate, params[:user][:password])
    #return redirect_to login_path unless authentication
    if !authentication
      flash[:notice] = "WHAT ARE YOU?????"
      return redirect_to login_path
    end
    session[:user_id] = @user.id
    session[:name] = @user.name
    redirect_to '/'
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def logged_out?
    session[:name] == nil
  end
end
