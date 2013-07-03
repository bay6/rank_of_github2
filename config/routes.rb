Rank::Application.routes.draw do
  resources :commits


  resources :projects


  devise_for :members, :controllers => { :omniauth_callbacks => "members/omniauth_callbacks" }  
  

   root :to => 'homes#index'
end
