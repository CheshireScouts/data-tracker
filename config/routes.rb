DataTracker::Application.routes.draw do
  resources :organisation_types, :organisations


  authenticated :user do
    root :to => 'organisations#index'
  end
  root :to => "home#index"

  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :users
end