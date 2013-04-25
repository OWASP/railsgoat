Railsgoat::Application.routes.draw do

  get "users/new"

get "login" => "sessions#new"
get "signup" => "users#new"

resources :sessions do

end

resources :users do

end

resources :tutorials do

end

root :to => "sessions#new"

end
