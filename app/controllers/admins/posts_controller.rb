class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render :show
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :category_id, :image, :content, :place, :tips, :course, :tag_list, post_images_images: [])
  end
end
