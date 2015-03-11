Rails.application.routes.draw do
  resources :lists do
    resources :items do
    	patch :complete
    end
  end

  root  'lists#index'

end
