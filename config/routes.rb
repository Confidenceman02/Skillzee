Rails.application.routes.draw do

  
  get 'admin/dashboard', to: 'admin_dashboard#home'
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
  get 'courses_all', to: 'home#courses_all'
  get 'users', to: 'users#index'
  match 'users/:id', to: 'users#destroy', as: :destroy_user, via: :delete
  devise_for :users, path_prefix: 'd', controllers: {
        sessions: 'users/sessions'
      }
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
