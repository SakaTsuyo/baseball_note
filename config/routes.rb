Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers,only: [:show]
  resources :students,only: [:show]
  resources :tweets do
    resources :comments, only: [:create]
  end
  get 'student_tweet/:id' => 'tweets#show2', as: :show2
  root 'hello#index'
  get 'hello/index' => 'hello#index'
end
