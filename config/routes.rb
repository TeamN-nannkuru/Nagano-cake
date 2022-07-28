Rails.application.routes.draw do

  root 'public/homes#top'
  get 'admin'=>'admin/homes#top'
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #管理者
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    
    resources :genres, only: [:index, :create, :edit, :update]
    
    get 'orders/index'
    get 'orders/show'
    
    resources :customers, only: [:index, :show, :edit, :update]
  end  

  #顧客
  namespace :public, :path => '' do
    get '/about'=>'homes#about'
    
    resources :items, only: [:index, :show]
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
    resources :orders, only: [:new, :show, :index, :create]
    get 'orders/:id/infomation'=>'orders#infomation', as: 'orders/infomation'
    
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items'=>'cart_items#destroy_all', as: 'cart_items/destroy_all'
    
    resources :customers, only: [:show, :edit, :update]
    get 'customers/:id/quit'=>'customers#quit', as: 'customers/quit'
    patch 'customers/remove'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end