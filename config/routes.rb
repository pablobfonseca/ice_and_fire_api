Rails.application.routes.draw do
  namespace :api do
    resources :external_books, only: :index

    namespace :v1 do
      resources :books, except: [:new, :edit]
    end
  end
end
