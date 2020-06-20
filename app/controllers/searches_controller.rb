class SearchesController < ApplicationController
	def post
		@posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: :desc)
		@tag = params[:tag_name]
  	end

	private
	def tag_params
		params.require(:search).permit(:tag_name)
	end
end
