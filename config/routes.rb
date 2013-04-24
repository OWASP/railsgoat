Railsgoat::Application.routes.draw do

get "login" => "sessions/new"

resources :sessions do

end

root :to => "sessions#new"

end
