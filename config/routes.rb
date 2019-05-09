Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:"sessions#new"
  
  get "/login",controller:"sessions",action:"new"
  post "/logout",controller:"sessions",action:"destroy"
  get "/signup",controller:"users",action:"new"

 
  resources :users, only:[:new,:create,:show]
  resources :sessions , except:[:edit,:index]
  resources :events , only:[:index,:new,:show,:create]
  resources :attendances, only:[:create]
  
end
