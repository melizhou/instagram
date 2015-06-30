Rails.application.routes.draw do
  

root 'photos#newsfeed'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do 
    resources :photos
end

devise_scope :user do
  get 'sign_out', :to => 'devise/sessions#destroy' 
end

  resources :photos do
    resources :comments 
  end
  resources :users do
  	resources :comments
  end

 
end
