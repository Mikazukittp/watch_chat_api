Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      namespace :a do
        resources :messages, only: [:index, :show, :create]
        resources :connections, only: [:show, :create, :destroy]
        resources :users do
          ##テスト用のパス
          collection do
            get:hello
          end
        end

      end

      namespace :i  do
        resources :messages, only: [:index, :show, :create]
        resources :connections, only: [:show, :create, :destroy]
      end
    end
  end
end
