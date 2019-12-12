Rails.application.routes.draw do


  resources :users

  

  resources :tables do
    collection do
      delete :destroy_all
    end
    resources :seats
  end

  resource :session, only: [:new, :create, :destroy]
  get('/', {to: 'welcome#index', as: :root})
  post('/users/filter', {to: 'users#filter', as: :filter_users})

end
