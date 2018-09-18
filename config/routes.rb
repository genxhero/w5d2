Rails.application.routes.draw do

  get 'posts/new'
  get 'posts/edit'
  get 'posts/create'
  get 'posts/update'
  get 'posts/index'
  get 'posts/show'
resources :users, only: [:new, :create]
resource :session, only: [:new, :create, :destroy]
resources :subs, except: [:destroy]
resources :posts, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end