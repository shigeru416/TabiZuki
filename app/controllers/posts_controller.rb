class PostsController < ApplicationController
	def new
		@post = Post.new
		@categories = Category.all
		@post.post_images.build
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to post_path(@post)
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
		
		new_history = @post.browsing_histories.new
    	new_history.user_id = current_user.id
    	if current_user.browsing_histories.exists?(post_id: "#{params[:id]}")
			old_history = current_user.browsing_histories.find_by(post_id: "#{params[:id]}")
			old_history.destroy
	    end
	    new_history.save

	    histories_stock_limit = 10
	    histories = current_user.browsing_histories.all
	    if histories.count > histories_stock_limit
	      histories[0].destroy
	    end
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		@post_comment = PostComment.new
		render :show
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_path(current_user)
	end

	private
	def post_params
		params.require(:post).permit(:user_id, :title, :category_id, :image, :content, :place, :tips, :course, :tag_list, post_images_images: [])
	end
end
