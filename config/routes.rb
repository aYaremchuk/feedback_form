Rails.application.routes.draw do
  root 'feedbacks#new'

  resources :feedbacks, only: %i[new create show]

  namespace :admin do
    get '/', to: 'feedbacks#index'
    resources :feedbacks, only: %i[destroy]
  end
end
