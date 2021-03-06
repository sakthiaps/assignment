Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  root "home#index"

  resources :tweets
  resources :users do
    post :follow
    post :unfollow
  end

end
