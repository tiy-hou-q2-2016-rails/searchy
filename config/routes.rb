Rails.application.routes.draw do

  get 'endpoints' => 'endpoints#index', as: :endpoints

  get 'endpoints/new' => 'endpoints#new', as: :new_endpoint
  post 'endpoints' => 'endpoints#create', as: :create_endpoint

  root 'searches#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
