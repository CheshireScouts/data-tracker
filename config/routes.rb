DataTracker::Application.routes.draw do
  get "reports/awards"

  get "reports/membership"

  resources :membership_types


  resources :award_types


  resources :awards do
    collection { post :import}
    collection { get :upload}
  end


  resources :memberships


  resources :years


  resources :organisation_types, :organisations


  authenticated :user do
    root :to => 'memberships#index'
  end
  root :to => "home#index"

  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :users
end