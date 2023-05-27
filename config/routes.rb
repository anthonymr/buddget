Rails.application.routes.draw do
  resources :users do
    resources :groups
  end

  resources :groups do
    resources :payments
  end

  root 'groups#index'
end
