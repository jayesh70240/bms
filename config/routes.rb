Rails.application.routes.draw do
  devise_for :users

  root'main#index'
  get "/movies", to: "main#movies"
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
end
