Rails.application.routes.draw do
  root 'top#index'
  resources :colognes do
    member {get :send_img}
  end
  post '/colognes' => 'cologne#event'
end
