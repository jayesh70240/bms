Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "login", to: "devise/sessions#new"
    delete "signout", to: "devise/sessions#destroy"
    get "edit", to: "devise/registrations#edit"
  end

  root'main#index'
  get "/movies_list", to: "bookings#index"
  get "/stream", to: "main#stream"
  get "/events", to: "main#events"
  get "/plays", to: "main#plays"
  get "/sports", to: "main#sports"
  get "/activities", to: "main#activities"
  get "/buzz", to: "main#buzz"
  get "/listyourshow", to: "main#listyourshow"
  get "/corporates", to: "main#corporates"
  get "/offers", to: "main#offers"
  get "/giftcards", to: "main#giftcards"
  get"ticketbook", to: "main#ticketbook"

  resources :bookings, only: [:index, :new, :create]
  get '/users_booking', to: 'users#users_booking'

  resources :users do
    get 'cart', on: :member
  end

  # resources :movies, only: [:show]
end
