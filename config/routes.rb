VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages, :only => [:index, :new, :create, :edit, :update]
  end

  root :to => 'admin/pages#index'
end
