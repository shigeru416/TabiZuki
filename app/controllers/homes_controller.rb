class HomesController < ApplicationController
	def about
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
		@user_posts = @user_posts.sort_by{|posts| posts.created_at}.reverse

	end

	def favorites
		@user_favorites = current_user.favorites.order(created_at: :desc)
	end

	def ranking
		@posts = Post.all
	end

	def new
		@posts = Post.all
	end
end
