Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      namespace :a do
        resource :messages, only: [:index, :show, :create]
      end

      namespace :i do
        resource :messages, only: [:index, :show, :create]
      end
    end
  end
end
