Rails.application.routes.draw do
  root to: 'public/homes#top'
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :orders
    resources :customers
    resources :items
    resources :homes
  end

   scope module: :public do
    resources :items
    resources :homes
    resources :orders
    get 'orders/log'
    get 'orders/thanks'
    resources :cart_items
    get 'cart_items/destroy_all'
    resources :customers
   # get 'customers/:id/edit' => 'customers#edit',as: 'edit_customer'
    get 'customers/quit'
    get 'customers/out'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
