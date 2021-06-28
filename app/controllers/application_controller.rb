class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, only: %i[show]
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_search
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def set_search
    # @post = Post.ransack(params[:q]) #ransackの検索メソッド
    # @post_products = @post.result(distinct: true).order(created_at: "DESC").includes(:user).page(params[:page])
    @search = Post.ransack(params[:q])
    @search_posts = @search.result(distinct: true).order(created_at: "DESC")
  end

  protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    end

end
