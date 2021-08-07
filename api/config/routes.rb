Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  namespace :api do
    namespace :v1 do
      resource :users do
        resource :histories, only: %i[show create destroy]
      end
      resource :tags, only: %i[index]
    end
  end
end
