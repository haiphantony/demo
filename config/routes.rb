Rails.application.routes.draw do
  resources :developers

   namespace :api do
      resources :developers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
