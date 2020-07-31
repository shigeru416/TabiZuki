class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:about, :tabizukimembership, :home, :ranking, :new]
  def about
  end

  def tabizukimembership
  end

  def home
    @categories = Category.all
    @posts = Post.all
  end

  def timeline
    @user = current_user
    @users = @user.following_user

    @user_posts = []
    @users.each do |user|
      @posts = user.posts
      @posts.each do |post|
        @post = post
        @user_posts << @post
      end
    end
    @user_posts = @user_posts.sort_by { |posts| posts.created_at }.reverse
    @posts = Kaminari.paginate_array(@user_posts).page(params[:page])
  end

  def favorites
    @user_favorites = current_user.favorites.order(created_at: :desc)
    @posts = @user_favorites.page(params[:page])
  end

  def ranking
    @posts = Post.all.order(favorite_count: :desc).page(params[:page])
  end

  def new
    @posts = Post.all.order(created_at: :desc).page(params[:page])
  end
end
