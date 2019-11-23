Rails.application.routes.draw do

  resources :users
  
  resource :session, only: [:new, :create, :destroy]
  get('/', {to: 'welcome#index', as: :root})

end
