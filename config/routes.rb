Rails.application.routes.draw do
  

root 'photos#index'

  devise_for :users do 
    resources :photos
end
  resources :photos do
    resources :comments 
  end

 
end
