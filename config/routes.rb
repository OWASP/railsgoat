Railsgoat::Application.routes.draw do

get "login" => "sessions#new"
get "signup" => "users#new"
get "logout" => "sessions#destroy"

resources :sessions do

end

resources :users do

end

resources :tutorials do

end

resources :dashboard do 
  get "home" => "dashboard#home"
end

root :to => "sessions#new"

end
