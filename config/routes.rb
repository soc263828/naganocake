Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
    resources :orders
    resources :customers
    resources :items
    resources :homes
  end

   scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items
    resources :orders
    post 'orders/log'
    get 'orders/thanks'
    delete 'cart_items/destroy_all'
    delete 'cart_items/:id/destroy' => 'cart_items#destroy',as: 'cart_items_destroy'
    resources :cart_items, only: [:index, :update, :create]
   # get 'customers/:id/edit' => 'customers#edit',as: 'edit_customer'
    get 'customers/quit' => 'customers#quit'
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    delete 'customers/out' => 'customers#out'
    patch 'customers' => 'customers#update'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
