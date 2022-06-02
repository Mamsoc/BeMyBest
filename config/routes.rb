Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :projects, only: [:new , :create, :show, :edit, :update, :index] do
    resources :memories, only: [:new , :create, :show, :edit, :update, :index]
    resources :cards, only: [:index, :show]
    get '/game', to: 'projects#game'

  end
end
