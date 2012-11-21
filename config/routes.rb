Riado::Application.routes.draw do
  resources :regions do
      get :set_current, :on => :member     
  end

  root :to => 'application#index'
end
