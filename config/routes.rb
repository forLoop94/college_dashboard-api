Rails.application.routes.draw do
  get 'current_user', to: "current_user#index"
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :students, only: [:index, :show, :create, :update, :destroy]
      resources :lecturers, only: [:index, :show, :new, :create, :destroy]
      resources :courses, only: [:index, :show, :new, :create, :destroy]
      resources :grades, only: [:index, :show, :create, :update, :destroy]
      resources :hods, only: [:index, :show, :create, :update, :destroy]
      resources :deans, only: [:index, :show, :create, :update, :destroy]

      get 'course_grade', to: 'students#course_grade'
      get 'recommended_courses', to: 'students#recommended_courses'
      get 'assigned_courses', to: 'lecturers#assigned_courses'
      get 'course_list/:id', to: 'lecturers#course_list'
      get 'course_students/:id', to: 'courses#course_students'
      get 'target_grade/:student_id/:id', to: 'grades#target_grade'
    end
  end
end
