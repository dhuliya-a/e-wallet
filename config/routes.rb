Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, param: :username


  post '/auth/login', to: 'authentication#login'
  post '/auth/logout', to: 'authentication#logout'

  resources :wallet_transactions do
    collection do
      post 'send_money'
    end
  end

  # get '/*a', to: 'application#not_found'

end
