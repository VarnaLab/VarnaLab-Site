VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages, :only => [:index, :new, :create, :edit, :update, :destroy]
  end

  root :to => 'admin/pages#index'
end
