Rails.application.routes.draw do
  namespace :api do
    resources :external_books, only: :index
  end
end
