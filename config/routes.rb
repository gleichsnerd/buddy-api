Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => 'api/v1/users', :sessions => 'sessions'}
  resources :sessions, :only => [:create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :create, :edit]
      resources :mailbox
      resources :letter
    end
  end

end
