# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq/api"

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  authenticate :user, ->(user) { user.super_admin? } do
    mount Sidekiq::Web => "/admin/sidekiq"
  end

  match "/monitoring/queue-latency" => proc {
    [200, {"Content-Type" => "text/plain"}, [Sidekiq::Queue.new.latency < 30 ? "OK" : "UHOH"]]
  }, :via => :get

  resources :dashboard, only: [:index]
  root "pages#index"
end
