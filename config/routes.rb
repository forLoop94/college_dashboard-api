Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :students, only: [:index, :show, :create, :update, :destroy]
      resources :lecturers, only: [:index, :show, :new, :create, :destroy]
      resources :courses, only: [:index, :show, :new, :create, :destroy]

      get 'metaData/:id', to: 'students#course_metadata'
    end
  end
end
