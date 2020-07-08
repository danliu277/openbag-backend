Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/customers', to: 'customers#index'
  get '/customers/:id', to: 'customers#show'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
  post '/employees', to: 'employees#login'

  get '/vendors', to: 'vendors#index'
  get '/vendors/:id', to: 'vendors#show'

  get '/games', to: 'games#index'
  get '/games/genre/:genre', to: 'games#genre'
  get '/games/:id', to: 'games#show'

  get '/sales', to: 'sales#index'
  get '/sales/:id', to: 'sales#show'

  get '/purchase_orders', to: 'purchase_orders#index'
  get '/purchase_orders/:id', to: 'purchase_orders#show'
end
