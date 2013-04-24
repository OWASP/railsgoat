Railsgoat::Application.routes.draw do

  get "users/new"

get "login" => "sessions#new"

resources :sessions do

end

root :to => "sessions#new"

end
