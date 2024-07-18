Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#login'
  post 'signup', to: 'users#create'

  resources :parking_spots do
    collection do
      post :shuffle_cars
      post :admit_car
      post :exit_car
    end
  end
end
