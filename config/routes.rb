DataTracker::Application.routes.draw do
  resources :scout_types


  get "reports/awards"

  get "reports/membership"

  resources :reports

  resources :membership_types


  resources :award_types


  resources :awards do
    collection { post :import}
    collection { get :upload}
  end


  resources :memberships


  resources :years


  resources :organisation_types

  resources :organisations do
    collection { post :import}
    collection { get :upload}
  end

  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :users

  authenticated :user do
    root :to => 'reports#membership'
  end
  root :to => "home#index"
end