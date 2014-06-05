Rails3DeviseRspecCucumber::Application.routes.draw do
  authenticated :user do
    root :to => 'fees#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :fees
end