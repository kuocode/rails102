Rails.application.routes.draw do

    devise_for :users

    resources :groups do
        resources :posts
        # resources :jobs 自动创建遵循 RESTful 的 url 格式。
    end

    root 'groups#index'

end
