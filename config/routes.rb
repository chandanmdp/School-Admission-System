Rails.application.routes.draw do

  root 'access#menu'
  get 'fee/index'
  get 'sessions/new'
  get 'appointments/index'
  get 'payments/index'
  get 'access/menu'
  get 'candidates/index'
  get 'fees/new'
  post 'candidates/build'
  get 'candidates/select'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :eligibilities, except: [:show]
  resources :notices
  resources :users
  resources :fees
  resources :sections do

    resources :candidates do
      get 'manage', on: :member
      resources :appointments
      resources :payments
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
