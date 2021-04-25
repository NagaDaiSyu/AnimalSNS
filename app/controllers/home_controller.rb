class HomeController < ApplicationController
  def index
    @users = User.page(params[:page]).per(1)
    @post = current_user.posts.build if user_signed_in?
  end

  def help
  end
end
