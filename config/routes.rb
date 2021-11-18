Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get 'campus', to: 'pages#campus'
  resources :subjects do
    resources :chapters, except: %i[destroy edit update index] do
      resources :materials, except: %i[destroy edit update index]
    end
  end
  resources :chapters, only: %i[destroy edit update]
  resources :materials, only: %i[destroy edit update]

  resources :chatrooms, only: %i[index show create] do
    resources :messages, only: :create
  end

  resources :schedules, except: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
