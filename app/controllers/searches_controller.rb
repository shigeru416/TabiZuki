class SearchesController < ApplicationController
	def post
		@posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: :desc).page(params[:page])
		@tag = params[:tag_name]
  	end

  	def tag
    	@posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: :desc).page(params[:page])
    	@posts.each do |post|
    		post.tags.each do |tag|
    			@tag_name = tag.name
    			if params[:tag_name] == @tag_name
    				@tag = @tag_name
    			end
    		end
    	end
	end

	private
	def tag_params
		params.require(:search).permit(:tag_name)
	end
end
