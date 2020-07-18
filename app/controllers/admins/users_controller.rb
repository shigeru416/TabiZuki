class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@q = User.ransack(params[:q])
    	@users_search = @q.result(distinct: true)
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc).page(params[:page])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admins_user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admins_users_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :image, :introduction)
	end
end
