Rails.application.routes.draw do
  require "sidekiq/web"

  devise_for :users
  root to: 'pages#home'

  # Sidekiq Web UI, only for admins.
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
