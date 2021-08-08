Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resource :users do
        resource :histories, only: %i[show create destroy]
      end
      resource :tags, only: %i[index]
    end
  end
end
