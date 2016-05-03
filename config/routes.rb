Rails.application.routes.draw do
  resources :courses, only: [:new, :create, :show]
  resources :students, only: [:new, :create, :show]
end
