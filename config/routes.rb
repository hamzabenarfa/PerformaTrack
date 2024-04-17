Rails.application.routes.draw do
  devise_for :users
  resources :dashboard
  resources :documents

  get "up" => "rails/health#show", as: :rails_health_check
  get '*path', to: 'application#handle_unknown_routes'


  devise_scope :user do
    authenticated :user do
      root "dashboard#index", as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new'
    end
  end
  
end
