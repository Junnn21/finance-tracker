Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root to: "home#index"
  get 'my_portofolio', to: 'users#my_portofolio'
  get 'search_stock', to: 'stocks#search', defaults: { format: :turbo_stream }
end
