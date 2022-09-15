Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'my_portofolio', to: 'users#my_portofolio'
  get 'search_stock', to: 'stocks#search', defaults: { format: :turbo_stream }
end
