VarnaLab::Application.routes.draw do
  namespace :admin do
    resources :pages
  end

  root :to => 'admin/pages#index'
end
