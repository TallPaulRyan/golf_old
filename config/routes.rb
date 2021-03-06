Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'


  get '/users' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  resources :scores
  
  resources :courses do
    resources :course_details, only: [:index, :new, :create, :destroy]
  end


  scope :courses, via: [:get, :post] do
    match 'initializeCourseDetails' => 'courses#initialize_course_details', as: :initialize_course_details 
  end

  # get '/scores/index' => 'scores#index' #scores#index
  # get '/scores/new' => 'scores#new' #scores#new
  # post '/scores' => 'scores#create' #scores#create
  # delete '/scores/:id' => 'scores#destroy' #scores#destroy
  # get 'scores/:id' => 'scores#show' #scores#show
  # get 'scores/:id/edit' => 'scores#edit' #scores#edit


end
