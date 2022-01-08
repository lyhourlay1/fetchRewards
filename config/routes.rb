Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show] do 
    resources :transactions, only: [:create, :index]
    resources :spends, only: [:create]
  end
end
