Riado::Application.routes.draw do
  
  resources :regions do
      get :set_current, :on => :member     
  end
  
  resources :acols
  
  root :to => 'application#index'
end
