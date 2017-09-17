Rails.application.routes.draw do



  get 'sessions/new'

  root 'access#menu'

  get 'access/menu'
  get 'candidates/index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :eligibilities, except: [:show]
  resources :notices
  resources :users

  resources :sections do
    resources :candidates do
      member do
        get :manage
      end
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
