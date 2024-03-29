Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  get '*path', to: 'application#handle_unknown_routes'
  root "dashboard#index"

end
