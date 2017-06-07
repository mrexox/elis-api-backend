Rails.application.routes.draw do

  # For all these methods in controllers
  # authorization needed
  scope '/admin' do
    get 'messages', to: 'messages#index'
    delete 'messages/:id', to: 'messages#destroy'

    post 'images', to: 'images#create'
    get 'images', to: 'images#index'
    delete 'images/:id', to: 'images#destroy'

    resources :slides
    resources :posts do
      resources :tags
    end

    post 'portfolio', to: 'portfolio#create'
    put 'portfolio/:id', to: 'portfolio#update'
    get 'portfolio', to: 'portfolio#index'
    delete 'portfolio/:id', to: 'portfolio#destroy'
  end
  
  get 'blog/:permalink', to: 'public#show_post'
  put 'blog/:permalink', to: 'public#like_post'
	get 'home', to: 'public#home'
	get 'blog', to: 'public#blog'
	get 'portfolio', to: 'public#portfolio'
  post 'messages', to: 'messages#create'
  post 'authenticate', to: 'authentication#authenticate'
end
