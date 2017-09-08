Rails.application.routes.draw do


  root 'candidates#index'

  resources :sections do
    get 'status', on: :member
    resources :candidates do
      member do
        get :manage
      end
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
