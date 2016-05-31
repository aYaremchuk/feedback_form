Rails.application.routes.draw do
  root 'feedbacks#new'

  resources :feedbacks, only: [:new, :create, :show]

  namespace :admin do
    get '/', to: 'feedbacks#index'
    resources :feedbacks, only: [:destroy]
  end

end
