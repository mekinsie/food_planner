Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  resources :recipes do
    resources :ingredients
  end

  resources :ingredients do
    resources :recipes
  end
end
