Rails.application.routes.draw do

    devise_for :users

    resources :groups do
        member do
            post :join
            post :quit
        end
        resources :posts
        # resources :jobs 自动创建遵循 RESTful 的 url 格式。
    end

    namespace :account do
        resources :groups
        resources :posts
    end

    root 'groups#index'

end
