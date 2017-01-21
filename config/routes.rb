Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'suppliers#index'

  get 'suppliers' => 'suppliers#index'
  get 'goods' => 'goods#index'
  post 'suppliers/import' => 'suppliers#import'
  post 'goods/import' => 'goods#import'
end
