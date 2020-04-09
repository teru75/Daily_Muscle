Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :customers
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

  resources :customers, only: [:show, :edit, :update, :index] do
    resources :my_menus, only: [:index, :create, :update, :destroy] do
      resource :my_menu_likes, only: [:create, :destroy]
    end
    resource :my_supplements, only: [:index, :create, :update, :destroy]
    resource :my_gyms, only: [:index, :create, :update, :destroy]
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :events, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :event_likes, only: [:create, :destroy]
  end

  resources :event_templates, only: [:index]
  resources :datas, only: [:index]
  resources :groups, only: [:new, :create, :index, :show, :update]
  get 'customer/groups' => 'groups#customer_index'
  resources :group_customers, only: [:destroy]

  namespace :admin do
    resources :event_templates, only: [:index, :new, :create, :show, :edit, :update]
    resources :menu_templates, only: [:create, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :events, only: [:index, :show]
  end
end
