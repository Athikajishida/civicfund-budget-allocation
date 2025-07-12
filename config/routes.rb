Rails.application.routes.draw do
  # Admin panel
devise_for :admins, skip: [:registrations]

  namespace :admin do
    root "dashboard#index"
    get "dashboard/index"
  end

  # Resident side
  devise_for :users
  root "home#index"
  resources :allocations, only: [:create]
end
