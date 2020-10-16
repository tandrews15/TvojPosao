Rails.application.routes.draw do
  resources :job_aplications
  resources :jobs
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #collection for my methods
end
