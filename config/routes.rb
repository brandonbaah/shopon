Rails.application.routes.draw do
  get '/products' => 'products#index'
  get 'products/new' => 'products#new'
  get '/products/:id' => 'products#show'
  get '/dumbbells' => 'products#dumbbells'
  get '/sofa' => 'products#sofa'
  get '/telescope' => 'products#telescope'
  get '/iphone' => 'products#iphone'
  get '/pullup_bar' => 'products#pullup_bar'
  get '/new_product' => 'products#new_product'
end
