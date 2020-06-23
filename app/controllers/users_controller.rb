class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc).page(params[:page])
	end

	def edit
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc).page(params[:page])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render :show
		else
			@posts = @user.posts.order(created_at: :desc).page(params[:page])
			render :edit
		end
	end

	def list
		@user = User.find(params[:id])
		@posts = @user.wannago_lists.order(created_at: :desc).page(params[:page])
	end

	private
	def user_params
		params.require(:user).permit(:name, :image, :introduction)
	end
end
