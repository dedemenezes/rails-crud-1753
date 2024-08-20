Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


  # !!!! ROUTES SYNTAX !!!!
  # verb '/path', to: 'controller_name#action', as: :prefix

  # my routes wil compare the path from the browser in here
  # IN ORDER
  # /restaurants/new is a match against <route>? ⤵️

  # See all restaurants
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Display the new form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant

  # Receive the form submission
  post '/restaurants', to: 'restaurants#create'

  # See one restaurant
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # Display the EDIT form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant

  # Receive the EDIT form submission
  patch '/restaurants/:id', to: 'restaurants#update'

  # Delete one restaurant
  delete '/restaurants/:id', to: 'restaurants#destroy'



end
