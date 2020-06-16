Rails.application.routes.draw do

	root "homes#home"
	get "/about", to:"homes#about"
	get "/timeline", to:"homes#timeline"
	get "/favorite_posts", to:"homes#favorite_post"
	devise_for :users
	resources :posts, only:[:new, :create, :show, :edit, :update, :destroy] do
		resource :post_comments, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
		resource :wannago_lists, only: [:create, :destroy]
	end
	resources :users, only: [:show, :edit, :update] do
		resource :relationships, only: [:create, :destroy]
	    get 'follows' => 'relationships#follower', as: 'follows'
	    get 'followers' => 'relationships#followed', as: 'followers'
	end

	devise_for :admins
	namespace :admins do
		root "homes#home"
		resources :categories, only:[:index, :create, :destroy]
	end
end
