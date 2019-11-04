Rails.application.routes.draw do
  resources :budgets
  resources :expenses
  resources :users
  post "/login", to: "auth#create"
  post "/users", to: "users#create"
	get "/auto_login", to: "auth#auto_login"
	get "/persist", to: "users#persist"
  get "get_user_budgets", to: "budgets#get_user_budgets"
  post "add_to_wallet", to: "users#add_to_wallet"

end
