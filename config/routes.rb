Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/login",controller:"session",action:"new"
  get "/logout",controller:"session",action:"destroy"
  get "/signup",controller:"user",action:"new"
  
  resources :user, only:[:new,:create,:show]
  resources :session
end
