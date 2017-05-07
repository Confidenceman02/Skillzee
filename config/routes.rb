Rails.application.routes.draw do
  get 'bookings/new'

  get 'booking/new'

  resources :courses do
    resources :course_dates, only: [:index, :new, :create]
  end
  resources :bookings
  resources :course_dates, only: [:show, :edit, :update, :destroy]
  
  root 'home#index'
  get 'about', to: 'home#about'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
