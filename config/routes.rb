Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => 'api/v1/users', :sessions => 'sessions'}
  resources :sessions, :only => [:create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :create, :edit]
      resources :mailbox
      resources :letter
      resources :address_book_friends
      resources :friends, only: [:show]
      resources :address_book_friend_records
    end
  end

end
