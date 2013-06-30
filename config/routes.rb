Rank::Application.routes.draw do
  devise_for :members

   root :to => 'homes#index'
end
