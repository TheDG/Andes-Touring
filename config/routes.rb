Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  resources :ski_routes, only: %i[index show new create edit update] do
    resources :comments, only: %i[create], shallow: true
  end
  resources :users, only: %i[edit update]

  get '/privacy', to: redirect('/privacy_policy.html'), as: :privacy
end
