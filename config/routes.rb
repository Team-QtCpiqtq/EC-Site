Rails.application.routes.draw do
  devise_for :admin, skip: [:registration, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'admin' => 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end
  
  scope module: :public do
    devise_for :customers, skip: [:passwords], cnotrollers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customres
    resources :cart_items
    resources :orders
    resources :addresses
   
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
