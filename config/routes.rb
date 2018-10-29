Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'new_registrations' }
  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :orders, only: [:index, :show, :create, :destroy]
  resources :products do
    resources :comments
  end
  resources :users

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/landing_page'
  post 'payments/create'
  post 'simple_pages/thank_you'
  root 'simple_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
