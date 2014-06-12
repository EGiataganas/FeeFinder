FeeFinder::Application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => 'fees#index'
  end
  root :to => "fees#index"
  resources :users
  resources :fees
end