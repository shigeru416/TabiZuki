class Admins::CategoriesController < ApplicationController
	before_action :authenticate_admin!
	def index
		@categories = Category.all.page(params[:page])
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to admins_categories_path
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		@categories = Category.all
		redirect_to admins_categories_path
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end
