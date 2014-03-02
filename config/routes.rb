ScheduleApp::Application.routes.draw do
  
  root 'static#landing_page'

  # API Routes
  namespace :api do

    namespace :v1, defaults: {format: :json} do
      # Student Groups resource
      resources 'student_groups', only: [:index]

      # Teachers resource
      resources 'teachers', only: [:index]

      # Schedules resource
      resources 'schedules', only: [:index, :show, :create, :update]
    end
  end
  
end
