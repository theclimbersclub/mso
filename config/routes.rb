# frozen_string_literal: true

require "sidekiq/web"
require "sidekiq/api"

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  match "queue-latency" => proc {
    [200, {"Content-Type" => "text/plain"}, [Sidekiq::Queue.new.latency < 30 ? "OK" : "UHOH"]]
  }, :via => :get

  root "pages#index"
end
