Todo::Application.routes.draw do


  devise_for :users

  resources :tasks 

	 match '/my',  :to => 'tasks#my'


    root :to => "tasks#index"

  
end
