class HomeController < ApplicationController
  def index
    # @users = User.page(params[:page])
    # @post = current_user.posts.build if user_signed_in?
    @posts = Post.all
  end

  def help
  end
end
