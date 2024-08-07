Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :tasks
  patch 'tasks/:id/check', to: "tasks#check", as: "update_task"

  # read all ==============================================
  # get "tasks", to: "tasks#index"
  # create ================================================
  # get "tasks/new", to: "tasks#new", as: :new_task
  # post "tasks", to: "tasks#create"
  # read one ==============================================
  # get "tasks/:id", to: "tasks#show", as: :task
  # update ================================================
  # get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  # patch "tasks/:id", to: "tasks#update", as: :update_task
  # delete ================================================
  # delete "tasks/:id", to: "tasks#destroy"
end
