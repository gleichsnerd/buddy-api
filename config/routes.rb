Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => 'api/v1/users'}
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :create, :edit]
    end
  end

end
