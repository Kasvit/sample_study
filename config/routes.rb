Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'registrations/omniauth_callbacks'}
    
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
    devise_for :users, skip: :omniauth_callbacks, controllers: { registrations: "registrations/registrations" }

    resources :services
    resources :items
    resources :categories
    resources :users
    resources :contacts
    resources :companies
    resources :frontend
    resources :tasks
 
    get '/logo',  controller: 'frontend', action: 'logo',  as: :logo
    get '/cargoes',  controller: 'frontend', action: 'cargoes',  as: :cargoes
    get '/dashboard_screenshot',  controller: 'frontend', action: 'dashboard_screenshot',  as: :dashboard_screenshot
    get '/droplet_screenshot',  controller: 'frontend', action: 'droplet_screenshot',  as: :droplet_screenshot
    get 'frontend/status_bar'

    get '/own_cookie', controller: 'tasks', action: 'own_cookie', as: :own_cookie
    get '/caching_example', to 'tasks#caching_example'

    root 'home#index' 
    post "messages", to: "messages#create"
  end

end
