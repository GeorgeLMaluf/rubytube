Rails.application.routes.draw do  
  resources :videos
  root to: "homepage#index"
  devise_for :users
end
