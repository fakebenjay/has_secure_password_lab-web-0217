class WelcomeController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    redirect_to login_path unless session.include? :name
  end
end
