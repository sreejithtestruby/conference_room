Rails.application.routes.draw do
  resources :events
  resources :rooms
  post "show_calendar" => "home#show_calendar"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

end
