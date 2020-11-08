Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'


  get '/users' => 'users#new'
  post '/users' => 'users#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  get '/scores/index' => 'scores#index'
  get '/scores' => 'scores#new'
  post '/scores' => 'scores#create'

end
