class Admins::PostCommentsController < ApplicationController
	before_action :authenticate_admin!
	def destroy
		@post_comment = PostComment.find(params[:post_id])
		@post_comment.destroy
		@post = @post_comment.post
	end
end
