Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :users
  resources :tests

  # Api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'api_docs', to: 'api_docs#index'

      namespace :authentication do
        post :login
        post :logout
      end

      resources :tests, only: %w[index show]
      resources :answers, only: %w[create]
    end

    match "*path", to: "base#catch_404", via: :all
  end

  mount SwaggerUiEngine::Engine, at: '/api_docs'

  match "*path", to: "application#catch_404", via: :all
end
