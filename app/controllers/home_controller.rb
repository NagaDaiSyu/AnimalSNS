class HomeController < ApplicationController
  def index
    @users = User.page(params[:page]).per(1)
  end

  def help
  end
end
