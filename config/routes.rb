Rails.application.routes.draw do
  root to: 'classrooms#index'
  resources :classrooms, only: [:new, :create, :show]
  resources :courses, only: [:new, :create, :show]
  resources :students, only: [:new, :create, :show]
end
