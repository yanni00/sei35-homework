Rails.application.routes.draw do


  # Session (login form/form submit/logout) routes:
  get '/login' => 'session#new'        # login platforms
  post '/login' => 'session#create'    # form submit, check credentials, create Session
  delete '/login' => 'session#destroy' # logout (delete session)

  resources :users

  resources :mixtapes

end
