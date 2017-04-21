Rails.application.routes.draw do
  resources :orders, except: [:show, :edit ]
  devise_for :users
  resources :balances

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	root :to => 'home#index'
	resources :products do 
		resources :comments, only: [:create, :destroy]
		collection do
  	 	 	get :recent
  	 	 	get :price_ascending
  	 	 	get :computers
  	 	 	get :phones

  	 	end	
		member do
        	put "like" => "products#upvote" 
        	put "dislike" => "products#downvote" 
     	end
	end
  
  resources :searches
  resources :line_items, except: [:index]
  resources :carts, except: [:index, :update]	
end
