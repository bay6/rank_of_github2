Rank::Application.routes.draw do
  devise_for :members, :controllers => { :omniauth_callbacks => "members/omniauth_callbacks" }  
  

   root :to => 'homes#index'
end
