Tautoko::Application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  # Routes for jQuery TokenInput API calls and tag specific calls

  resources :groups, except: :index do
    member do
      post :add_members
      get :request_membership
    end
    get :add_subgroup
    resources :discussions do
      resources :messages
    end
  end

  resources :motions, except: :index do
    resources :votes
  end

  match "/motions/:id/close", :to => "motions#close_voting", :as => :close_motion_voting,
    :via => :post

  match "/motions/:id/open", :to => "motions#open_voting", :as => :open_motion_voting,
    :via => :post


  resources :votes
  resources :memberships, except: [:new, :show]
  resources :users
  resources :comments, only: :destroy do
    post :like, on: :member
    post :unlike, on: :member
  end
  match "/settings", :to => "users#settings", :as => :user_settings

  # route logged in user to dashboard
  resources :dashboard, only: :show
  authenticated do
    root :to => 'dashboard#show'
  end
  # route landing page to demo page
  match '/demo' => 'landing#demo'
  # route logged out user to landing page
  resources :landing, only: :show
  root :to => 'landing#show'
end
