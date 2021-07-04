class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def new #投稿ページ
    @post = current_user.posts.build if user_signed_in?
  end

  def index
    @posts = Post.all
    @tags = Post.tag_counts_on(:tags).most_used(20)    # タグ一覧表示
  end

  def home
  end

  def tags
    @tags = Post.tag_counts_on(:tags)
  end

  def search_tag
    @posts = Post.all
    @tag = Post.find_by(params[:tags])
  end

  def edit 
    @post = Post.find_by(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    # @post.tag_list.add('ネコ')
    if @post.save
      flash[:success] = "ツイートを投稿しました！"
      redirect_to posts_path
    else
    end
  end

  def update
    @post = Post.find_by(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render action: :edit
    end
  end


  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
      redirect_to posts_path
    end
  end

  def search
    @posts = Post.tagged_with("#{params[:tag_name]}")
  end

  private

    def post_params
      params.require(:post).permit(:content, :image, :tag_list)
    end
    

end
