Rails.application.routes.draw do

  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :user, except: [:new, :edit]
      resources :mailbox, except: [:new, :edit]
      resources :letter, except: [:new, :edit]
    end
  end

end
