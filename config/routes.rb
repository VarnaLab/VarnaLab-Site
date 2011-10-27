VarnaLab::Application.routes.draw do
  namespace :admin do
    root :to => 'pages#index'
    resources :pages

    match '/page/:page_id/comments/(:review)', :to => 'comments#index', :as => 'page_comments'

    resources :comments, :only => [] do
      post :review, :to => 'comments/reviews#create'
      delete :review, :to => 'comments/reviews#destroy'

      match '/(:review)', :to => 'comments#index', :as => '', :on => :collection
    end
  end

  resources :pages, :only => [:show] do
    resources :comments, :only => [:create]
  end

  root :to => 'pages#index'
end
