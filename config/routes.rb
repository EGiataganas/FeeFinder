FeeFinder::Application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => 'fees#index'
  end
  root :to => "home#index"
  resources :users
  resources :fees
  resources :non_money_claims_fees, path: "fees"
  resources :hearing_fees, path: "fees"
end