Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :projects, only: [:new , :create, :show, :edit, :update, :index, :destroy] do
    member do
      patch '/fav', to: 'projects#fav'
    end

    resources :memories, only: [:new , :create, :show, :edit, :update, :index]
    resources :cards, only: [:index, :show]
    resources :games, only: [:index, :show]
    get :win
    get :thanks
  end
end
