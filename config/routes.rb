VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages
    resources :comments, :only => [] do
      post :review, :to => 'comments/reviews#create'
      delete :review, :to => 'comments/reviews#destroy'

      match '/(:review)', :to => 'comments#index', :as => '', :on => :collection
    end
  end

  root :to => 'admin/pages#index'
end
