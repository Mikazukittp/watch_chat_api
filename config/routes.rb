Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      namespace :a do
        resource :device_token, only: [:update]
        resource :message, only: [:index, :show, :create]
      end

      namespace :i do
        resource :device_token, only: [:update]
        resource :message, only: [:index, :show, :create]
      end
    end
  end
end
