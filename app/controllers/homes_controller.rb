class HomesController < ApplicationController
	def about
	end

	def home
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
end
