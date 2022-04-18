Rails.application.routes.draw do
  get 'advertisements/index'
  get 'advertisements/show'
  get 'advertisements/create'
  get 'advertisements/update'
  get 'advertisements/destroy'
  post    '/login'    => 'sessions#create'
  delete  '/logout'   => 'sessions#destroy'
  post    '/signup'   => 'users#create'

  #resource :profile, except: %i[index create], controller: :users"
end
