Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#login'
  post 'signup', to: 'users#create'
  # Other routes
end
