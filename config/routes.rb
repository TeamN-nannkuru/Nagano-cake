Rails.application.routes.draw do

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