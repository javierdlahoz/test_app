Rails.application.routes.draw do

  resources :urls, only: [:index, :create, :show]

end
