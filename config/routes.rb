VarnaLab::Application.routes.draw do
  devise_for :users

  namespace :admin do
    root :to => 'pages#index'
    resources :pages

    match '/page/:page_id/comments/(:review)', :to => 'comments#index', :as => 'page_comments'
    
    resources :users do
      match '/users/index', :to => 'users#index', :as => '', :on => :collection, :constraints => { :index => /[a-z]+ / }
    end
    resources :comments, :only => [:destroy] do
      post :review, :to => 'comments/reviews#create'
      delete :review, :to => 'comments/reviews#destroy'

     match '/(:review)', :to => 'comments#index', :as => '', :on => :collection, :constraints => { :review => /[a-z]+ / }
    end
  end

  resources :pages, :only => [:show] do
    resources :comments, :only => [:create]
  end

  root :to => 'pages#index'
end
