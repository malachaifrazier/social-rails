Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    member do
      get :friends
      get :followers
      get :deactivate
      get :mentionable
      get :complete_profile
      post :set_password
    end
  end

  resources :photo_albums
  resources :posts,    except: [:new, :index]
  resources :events,   except: [:edit, :update]
  resources :comments, only: [:create, :destroy]
  resources :photos,   only: [:create, :destroy, :update]

  authenticated :user do
    root to: 'home#index', as: 'home'
  end

  unauthenticated :user do
    root 'home#front'
  end

  post :follow, to: 'follows#create', as: :follow
  post :unfollow, to: 'follows#destroy', as: :unfollow
  post :like, to: 'likes#create', as: :like
  post :unlike, to: 'likes#destroy', as: :unlike
  get :find_friends, to: 'home#find_friends', as: :find_friends
  get :about, to: 'home#about', as: :about
  post :update_photo, to: 'photos#update', as: :update_photo
  post :update_photo_album, to: 'photo_albums#update', as: :update_photo_album

end
