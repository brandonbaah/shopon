Rails.application.routes.draw do
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  get '/products/:id' => 'products#destroy'

  get '/signup' => 'users#new'
  post 'users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sesssion#create'
  delete '/logout' => 'sessions#destroy'
end
