Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    api version: 1, module: :v1 do
      resources :questions, except: [:edit, :update, :delete] do
        put :upvote, on: :member
        put :downvote, on: :member
      end
    end
  end

  root 'application#index'
end
