Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[create index]
    end
  end
  resources :products, only: %i[index]
  root to: "products#index"
end
