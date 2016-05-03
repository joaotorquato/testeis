Rails.application.routes.draw do
  resources :classrooms, only: [:new, :create, :show]
  resources :courses, only: [:new, :create, :show]
  resources :students, only: [:new, :create, :show]
end
