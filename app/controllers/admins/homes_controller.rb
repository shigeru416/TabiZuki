class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def home
    @posts = Post.all
  end

  def today
    @posts = Post.all
  end
end
