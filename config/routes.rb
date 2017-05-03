Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: 'home#about'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
