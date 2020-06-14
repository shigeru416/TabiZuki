Rails.application.routes.draw do

	root "homes#home"
	get "/about", to:"homes#about"
	devise_for :users
	resources :posts, only:[:new, :create, :index, :show, :edit, :update] do
		resource :post_comments, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
		resource :wannago_lists, only: [:create, :destroy]
	end
	resources :users, only: [:show]

	devise_for :admins
	namespace :admins do
		root "homes#home"
		resources :categories, only:[:index, :create, :destroy]
	end
end
