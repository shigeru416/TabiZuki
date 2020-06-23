class HomesController < ApplicationController
	def about
	end

	def tabizukimembership
	end

	def home
		@categories = Category.all
		@posts = Post.all
		@places_array = []
		@posts.each do |post|
			@places_array << post.place
		end
		@places = @place_array
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
		@user_posts = @user_posts.sort_by{|posts| posts.created_at}.reverse

	end

	def favorites
		@user_favorites = current_user.favorites.order(created_at: :desc)
	end

	def ranking
		@posts = Post.all.order(favorite_count: :desc).page(params[:page])
	end

	def new
		@posts = Post.all.order(created_at: :desc).page(params[:page])
	end
end
