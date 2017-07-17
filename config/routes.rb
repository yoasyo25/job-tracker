Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {
                                          sign_in: "login", sign_out: "logout",
                                          sign_up: "register"
                                        }
  root 'companies#index'

  resources :companies do
    resources :contacts, only: [:create, :show]
    resources :jobs do
      resources :comments, only: [:create, :show]
  end
end
  resources :categories

  get '/jobs' => 'jobs#sort'
  get '/dashboard' => 'jobs#dashboard'
  get '/search' => 'jobs#search'
  get '/home' => 'jobs#home'
end
