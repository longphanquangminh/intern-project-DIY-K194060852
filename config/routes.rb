Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "jobs#index"
  devise_for :users
  devise_for :admins
  get "jobs/city/:city", to: "jobs#search", as: 'search_jobs_in_city'
  get "jobs/industry/:industry", to: "jobs#search", as: 'search_jobs_in_industry'
  get "detail/:id", to: "jobs#show", as: 'job_detail'

  resources :jobs do
    resources :favorites, only: %i[create destroy]
  end
  resources :cities
  resources :histories
  resources :favorites
  resources :industries
  resources :users

  resources :favorites, only: %i[index]

  as :user do
    get "login", to: "devise/sessions#new"
    get "register/1", to: "own_devise/registrations#new", as: 'user_register_path_1'
    # get "signin" => "devise/sessions#new"
    post "signin" => "own_devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"

    get     '/my' , to: 'users#edit', as: 'user_profile'
    get     '/my/info', to: 'users#edit', as: 'user_edit_profile'
    post    '/my' , to: 'users#update', as: 'user_update_profile'
  end

  as :admin do
    get "login", to: "devise/sessions#new"
    get "register/1", to: "devise/registrations#new"
    # get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

end
