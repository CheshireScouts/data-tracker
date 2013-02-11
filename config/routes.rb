DataTracker::Application.routes.draw do
  resources :census_table_formats
  resources :census_formats
  resources :scout_types
  resources :membership_types
  resources :award_types
  resources :memberships
  resources :years
  resources :organisation_types

  resources :awards do
    collection { post :import}
    collection { get :upload}
  end

  resources :organisations do
    collection { post :import}
    collection { get :upload}
  end

  match '/reports/:action/:organisation_id' => 'reports#:action'
  match '/reports/:action' => 'reports#:action'

  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :users

  authenticated :user do
    root :to => 'reports#pivot'
  end
  root :to => "home#index"
end