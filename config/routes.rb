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
    resources :cart_items
    get 'cart_items/destroy_all'
   # get 'customers/:id/edit' => 'customers#edit',as: 'edit_customer'
    get 'customers/quit' => 'customers#quit'
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/out' => 'customers#out'
    patch 'customers' => 'customers#update'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
