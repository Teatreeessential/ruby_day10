Rails.application.routes.draw do
    
    get '/boards' => 'board#index'
    get '/board/new' => 'board#new'
    get '/board/:id' => 'board#show'
    post '/boards' => 'board#create'
    get '/board/:id/edit' =>'board#edit'   
    put '/board/:id' => 'board#update'
    patch '/board/:id' => 'board#update'
    delete '/board/:id' => 'board#destroy'
    
    root 'user#index'
    get  '/user' => 'user#new'
    get  '/users' => 'user#show'
    post '/users' =>'user#create'
    get '/user/:id' => 'user#edit'
    put '/user/:id' =>'user#update'
    patch '/user/:id' =>'user#update'
    post '/login' => 'user#login'
    get '/login' => 'user#login'
    
    
    post '/sign_in' => 'user#login'
    get '/logout' =>'user#logout'
   


  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
