Rails.application.routes.draw do
    root 'events#index'
    
    resources :events
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    resources :event_users, path: "event_users/(:event)"
    
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
end
