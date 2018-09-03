Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#summary"
  resources :users do
  	get :summary, :on => :collection
  end
  resources :questions do
    post :answer, :on => :member
    get :question, :on => :collection
  end
end
