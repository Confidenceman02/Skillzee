Rails.application.routes.draw do
  resources :courses
  resources :course_dates
  root 'home#index'
  get 'about', to: 'home#about'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
