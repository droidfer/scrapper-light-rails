Rails.application.routes.draw do
  resources :webs, only: [:index, :show, :create]
  root "webs#index"
end
