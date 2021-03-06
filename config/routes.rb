Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts do
    collection do
      get :delete
    end
  end
  devise_for :users
  resources :users do
    collection do
      get :add_friends
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
