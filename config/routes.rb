VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages
    resources :comments, :only => [:index] do
      post :review, :to => 'comments/reviews#create'
      delete :review, :to => 'comments/reviews#destroy'

      get :hidden, :on => :collection
      get :visible, :on => :collection
    end
  end

  root :to => 'admin/pages#index'
end
