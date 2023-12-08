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
      resources :departments, only: [:index, :show, :create]
      resources :lecturer_courses, only: [:create, :destroy]
      resources :schools, only: [:index]
      resources :lesson_area, only: [:create]
      resources :chats, only: [:create]

      get 'course_grade', to: 'students#course_grade'
      get 'recommended_courses', to: 'students#recommended_courses'
      get 'assigned_courses', to: 'lecturers#assigned_courses'
      get 'course_list/:id', to: 'lecturers#course_list'
      get 'course_students/:id', to: 'courses#course_students'
      get 'course_lecturers/:id', to: 'courses#course_lecturers'
      get 'target_grade/:student_id/:id', to: 'grades#target_grade'
      get 'department_students', to: 'hods#department_students'
      get 'department_lecturers', to: 'hods#department_lecturers'
      get 'department_courses', to: 'hods#department_courses'
      get 'lecturer_courses/:id', to: 'lecturer_courses#allotment_data'
      get 'dean_index', to: 'departments#dean_index'
      get 'dean_list', to: 'deans#dean_list'
      get 'hods_list', to: 'deans#hods_list'
      get 'student_messages/:course_id/:id', to: 'students#student_messages'
      get 'submissions/:course_id/:id', to: 'students#submissions'
    end
  end
end
