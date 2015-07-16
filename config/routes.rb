Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :messages, only: [:index, :show, :create]
      resources :connections, only: [:show, :create, :destroy]
      resources :users do
        get 'opponent', on: :member
      end
    end
  end
end
