Rails.application.routes.draw do
  root 'pets#index'
  devise_for :users
  resources :users

  resources :pets, only: [:show] do
    resources :favorites
    resources :apps
  end

  namespace :api do
    namespace :v1 do
      resources :pets, only: [:index]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :pets, only: [] do
        resources :apps
        resources :favorites
    end
  end
end

end
