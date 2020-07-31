class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @Post_new = Post.new
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.score = Language.get_data(post_comment_params[:comment])
    @post_comment.save
    end

  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post_comment.destroy
    @post = @post_comment.post
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
