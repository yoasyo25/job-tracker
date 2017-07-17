Rails.application.routes.draw do

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

end
