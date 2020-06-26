Rails.application.routes.draw do

	root "homes#home"
	get "/about", to:"homes#about"
	get "/tabizukimembership", to:"homes#tabizukimembership"
	get "/timeline", to:"homes#timeline"
	get "/favorites", to:"homes#favorites"
	get "/ranking", to:"homes#ranking"
	get "/new", to:"homes#new"
	get 'chat/:id', to:"chats#show", as: 'chat'
	get "searches/post", to:"searches#post"
	get "searches/tag", to:"searches#tag"
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
	    member do
	    	get :list
	    end
	end
	resources :chats, only: [:create]
	resources :categories, only: [:show]

	devise_for :admins
	namespace :admins do
		root "homes#home"
		get "searches/tag", to:"searches#tag"
		get "homes/today", to:"homes#today"
		resources :categories, only:[:index, :create, :destroy]
		resources :users, only:[:index, :show, :edit, :update, :destroy]
		resources :posts, only:[:index, :show, :edit, :update, :destroy] do
			resource :post_comments, only: [:destroy]
		end
	end
end
