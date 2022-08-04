Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  resources :steps

  scope "(:locale)", locale: /fi|en/ do
    root 'index#index'

    get "show_all" => "index#show_all"
    get "show" => "index#show"

    get  'sessions/new'
    get  'login'   => 'sessions#new'
    post 'login'   => 'sessions#create'
    post 'logout'  => 'sessions#destroy'


    namespace :users do
      get    'new'             => 'users#new'
      post   'new'             => 'users#create'
      get    'list'            => 'users#list'
      post   'edit/:id'        => 'users#edit'
      post   'update'          => 'users#update'
      post   'destroy'         => 'users#destroy'

      post 'select_language' => 'steps#select_language'
      post 'authorization'   => 'steps#authorization'
      post 'create_user'     => 'steps#create_user'
      post 'go_to_main'      => 'steps#go_to_main'
      post 'list'            => 'steps#list'
    end

    namespace :work_shift_schedules do
      post   'new'             => 'work_shift_schedules#new'
      post   'create'          => 'work_shift_schedules#create'
      post   'show'        => 'work_shift_schedules#show'
      post   'update/:id'      => 'work_shift_schedules#update'
      post   'destroy'         => 'work_shift_schedules#destroy'
    end

    namespace :work_lists do
      post   'new'             => 'work_lists#new'
      post   'create'          => 'work_lists#create'
      post   'show'            => 'work_lists#show'
      post   'edit/:id'        => 'work_lists#edit'
      post   'update'          => 'work_lists#update'
    end

    namespace :examples do
      get  'users_for_example', to: "users_for_example#index"
      post 'user_new', to: "users_for_example#user_new"
    end
  end
end
