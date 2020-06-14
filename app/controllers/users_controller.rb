class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		render :show
	end

	def follows

	end

	def followers

	end

	private
	def user_params
		params.require(:user).permit(:name, :image, :introduction)
	end
end
