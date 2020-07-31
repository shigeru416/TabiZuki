class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = Category.find(params[:id]).posts.order(created_at: :desc).page(params[:page])
  end
end
