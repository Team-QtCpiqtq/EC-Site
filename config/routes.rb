Rails.application.routes.draw do
   devise_for :admin, skip: [:registration, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get 'top' => 'homes#top', as: "top"
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end
  
  scope module: :public do
    devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'custmoers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders
    resources :addresses
   
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
