Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :payments
  end

  get '/welcome', to: 'welcome#index'

  root 'groups#index'
end
