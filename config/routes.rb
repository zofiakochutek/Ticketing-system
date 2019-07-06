Rails.application.routes.draw do
  resources :events do
    resources :tickets
    resources :payment
  end
end
