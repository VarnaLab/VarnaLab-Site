VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages, :only => [:index, :new, :create]
  end

  root :to => 'admin/pages#index'
end
