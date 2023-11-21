class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    user_data = UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    user_data[:profile_exists] = user_profile?(current_user.role)
    user_data[:profile_id] = user_profile_id

    render json: user_data, status: :ok
  end

  private

  def user_profile_id
    case current_user.role
    when 'student'
      current_user.student.id if user_profile?('student')
    when 'lecturer'
      current_user.lecturer.id if user_profile?('lecturer')
    when 'HOD'
      current_user.hod.id
    when 'dean'
      current_user.dean.id
    else
      return nil
    end
  end

  def user_profile?(role)
    case role
    when 'student'
      Student.exists?(user_id: current_user.id)
    when 'lecturer'
      Lecturer.exists?(user_id: current_user.id)
    when 'HOD'
      Hod.exists?(user_id: current_user.id)
    when 'dean'
      Dean.exists?(user_id: current_user.id)
    else
      return false
    end
  end
end