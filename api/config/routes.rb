Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resources :sessions, only: %i[create]
        resources :registrations, only: %i[create]
        get :logged_in, to: "sessions#logged_in"
        delete :logout, to: "sessions#logout"
      end
    end
  end
end
