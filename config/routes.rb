# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'photos/create'
  resources :albums do
    resources :photos
  end
  patch 'drag/photo', to: 'drag#photo'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "albums/10"
  # root :controller => 'albums', :action => '/'
  # root "albums#show"
  root 'albums#index'
end
