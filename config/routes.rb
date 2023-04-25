Rails.application.routes.draw do
  resources :webs
  root "webs#index"
end
