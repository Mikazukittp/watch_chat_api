Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      namespace :a do
        resource :messages, only: [:index, :show, :create]
        resource :device_token, only: [:update]
        resources :users do
          ##テスト用のパス
          collection do
            get:hello
          end
        end
      end

      namespace :i do
        resource :messages, only: [:index, :show, :create]
      end
    end
  end
end
