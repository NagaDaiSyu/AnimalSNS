class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def new #投稿ページ

  end

  def index

  end


  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "ツイートを投稿しました！"
      redirect_to root_path #show_path
    else

    end
  end

  def destroy
    
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
    

end
