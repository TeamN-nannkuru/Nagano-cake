Rails.application.routes.draw do

  
  root 'public/homes#top'
  get 'admin'=>'admin/homes#top'
  
  namespace :public do
    get '/about'=>'homes#about'
  end
  namespace :public do
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items'=>'cart_items#destroy_all', as: 'cart_items/destroy_all'
  end
  namespace :public do
    resources :customers, only: [:show, :edit, :update]
    get 'customers/quit'
    patch 'customers/remove'
  end
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
  
  namespace :admin do
    get 'orders/show'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/infomation'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  
  #管理者商品
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end  

  #顧客商品
  namespace :public, :path => '' do
    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


