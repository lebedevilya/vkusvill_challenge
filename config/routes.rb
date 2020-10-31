# frozen_string_literal: true

Rails.application.routes.draw do
  root 'orders#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :items
  resources :orders, only: [:index, :show, :update] do
    post 'scan', to: 'orders#scan'
  end
end
