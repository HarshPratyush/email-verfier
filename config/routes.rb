Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home', :to => "home#index"
  root :to => "home#index"
  get 'search', :to =>  "home#search"
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect("/")
  get '/users/sign_in', :to => "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
