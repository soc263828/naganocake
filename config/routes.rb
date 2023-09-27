Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'orders/show'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'

    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'

    get 'homes/top'

    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/log'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'

    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'

    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/quit'
    get 'customers/out'

    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'

    get 'registrations/new'
    get 'registrations/create'

    get 'items/index'
    get 'items/show'

    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 namespace :public do
   resources :homes
 end
end
