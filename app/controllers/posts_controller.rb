class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def new #投稿ページ
    @post = current_user.posts.build if user_signed_in?
  end

  def index
    @posts = Post.all
  end


  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
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
      params.require(:post).permit(:content, :image)
    end
    

end
