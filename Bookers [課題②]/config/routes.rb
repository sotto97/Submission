Rails.application.routes.draw do
	get 'books/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  resources :books
  get 'books'=>'books#index'
  post 'books'=>'books#create'
  post 'books'=>'books#new'
  patch 'books/:id'=>'books#update', as: 'update_book'
  delete 'books/:id'=>'books#destroy', as: 'destroy_book'
end
