VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages
    resources :comments, :only => [:index] do
      post :hide, :to => 'comments/hide#create'
    end
  end

  root :to => 'admin/pages#index'
end
