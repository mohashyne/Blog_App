Rails.application.routes.draw do
  devise_for :users
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root 'users#index'
   # Defines the root path route ("/")
   get '/users', to: 'users#index'
 
   # root "articles#index"
   get '/users/:id', to: 'users#show', as: 'user'
 
   
   get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
   post '/users/:user_id/posts', to: 'posts#create', as: 'user_posts_create'
 
   get '/users/:user_id/posts/:post_id/comments/new', to: 'comments#new', as: 'new_user_post_comment'
   post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'user_post_comments'
 

   post '/user/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'user_post_likes'
 
   get '/user/:user_id/posts', to: 'posts#index', as: 'user_posts'
 
   get '/user/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
 
   resources :posts, only: [:show]
end
