VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages
    resources :comments, :only => [:index]
  end

  root :to => 'admin/pages#index'
end
