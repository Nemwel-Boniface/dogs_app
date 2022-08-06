Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # namespace will represent all my modules
  namespace :api do
    namespace :v1 do
      resources :dogs
    end
  end
end
