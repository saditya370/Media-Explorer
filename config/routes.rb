# frozen_string_literal: true

Rails.application.routes.draw do

  resources :albums do
    resources :photos
  end
  patch 'drag/photo', to: 'drag#photo'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'albums#index'
end
