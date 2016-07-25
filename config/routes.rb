Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => 'api/v1/users', :sessions => 'api/v1/sessions'}
  resources :sessions, :only => [:create, :destroy]
  
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :create, :edit]
    end
  end

end
