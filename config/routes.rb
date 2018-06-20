Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  get '/restaurants/:id', to: 'restaurants#show', as: 'restaurant'
end
