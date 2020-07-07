Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/customers', to: 'customers#index'
  get '/customers/:id', to: 'customers#show'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'

  get '/vendors', to: 'vendors#index'
  get '/vendors/:id', to: 'vendors#show'
end
