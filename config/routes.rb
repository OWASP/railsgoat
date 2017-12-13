# frozen_string_literal: true
Railsgoat::Application.routes.draw do

  get "login" => "sessions#new"
  get "signup" => "users#new"
  get "logout" => "sessions#destroy"

  get "forgot_password" => "password_resets#forgot_password"
  post "forgot_password" => "password_resets#send_forgot_password"
  get "password_resets" => "password_resets#confirm_token"
  post "password_resets" => "password_resets#reset_password"

  get "dashboard/doc" => "dashboard#doc"

  resources :sessions

  resources :users do
    get "account_settings"

    resources :retirement
    resources :paid_time_off
    resources :work_info
    resources :performance
    resources :benefit_forms
    resources :messages

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
    patch "update_user"
    get "get_all_users"
    get "analytics"
  end

  resources :dashboard do
    collection do
      get "home"
      get "change_graph"
    end
  end

  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :users
      resources :mobile
    end
  end

  root to: "sessions#new"
end
