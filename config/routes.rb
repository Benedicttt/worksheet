Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  scope "(:locale)", locale: /fi|en/ do
    root 'index#index'

    get 'sessions/new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    post   'logout'  => 'sessions#destroy'

    namespace :users do
      get    'new'             => 'users#new'
      post   'new'             => 'users#create'
      get    'list'            => 'users#list'
      get    'edit/:id'        => 'users#edit'
      post   'update'          => 'users#update'
      post   'destroy'         => 'users#destroy'
    end

    namespace :examples do
      get  'users_for_example', to: "users_for_example#index"
      post 'user_new', to: "users_for_example#user_new"
    end

  end
end
