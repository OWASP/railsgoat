Railsgoat::Application.routes.draw do

  get "login" => "sessions#new"
  get "signup" => "users#new"
  get "logout" => "sessions#destroy"
  match "forgot_password" => "password_resets#forgot_password"
  get "password_resets" => "password_resets#confirm_token"
  post "password_resets" => "password_resets#reset_password"


  resources :sessions do
  end

  resources :users do
    get "account_settings"

    resources :retirement do
    end

    resources :paid_time_off do
    end

    resources :work_info do
    end

    resources :performance do

    end

    resources :benefit_forms do

    end

    resources :messages do
    end

    resources :pay do
      collection do
        post "update_dd_info"
        post "decrypted_bank_acct_num"
      end
    end

  end

  get "download" => "benefit_forms#download"
  post "upload" => "benefit_forms#upload"

  resources :tutorials do
    collection do
      get "credentials"
      get "injection"
      get "xss"
      get "broken_auth"
      get "insecure_dor"
      get "csrf"
      get "misconfig"
      get "exposure"
      get "url_access"
      get "insecure_components"
      get "access_control"
      get "ssl_tls"
      get "redirects"
      get "guard"
      get "mass_assignment"
      get "constantize"
      get "gauntlt"
      get "logic_flaws"
    end
  end

  resources :schedule do
    collection do
      get "get_pto_schedule"
    end

  end

  resources :admin do
    get "dashboard"
    get "get_user"
    post "delete_user"
    put "update_user"
    get "get_all_users"
    get "analytics"
  end

  resources :dashboard do
    collection do
      get "home"
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
        resources :users
        resources :mobile
    end
   end


  root :to => "sessions#new"

end
