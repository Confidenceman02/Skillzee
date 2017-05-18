Rails.application.routes.draw do

  get 'search/category', to: 'search#courses'
  resources :charges
  get 'cart', to: 'cart#course_booking'
  resources :bookings
  resources :courses do
    resources :course_dates, only: [:index, :new, :create]
  end
  resources :course_dates, only: [:show, :edit, :update, :destroy]
  
  root 'home#index'
  get 'about', to: 'home#about'
  resources :users, only: [:index]
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
