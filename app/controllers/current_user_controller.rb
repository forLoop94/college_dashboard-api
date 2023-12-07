class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    user_data = UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    user_data[:profile_exists] = user_profile?(current_user.role)
    user_data[:profile_id] = user_profile_id

    render json: user_data, status: :ok
  end

  private

  # def user_profile_id
  #   case current_user.role
  #   when 'student'
  #     current_user.student.id if user_profile?('student')
  #   when 'lecturer'
  #     current_user.lecturer.id if user_profile?('lecturer')
  #   when 'hod'
  #     current_user.hod.id if user_profile?('hod')
  #   when 'dean'
  #     current_user.dean.id if user_profile?('dean')
  #   end
  # end

  def user_profile_id
    return unless user_profile?(current_user.role)

    case current_user.role
    when 'student' then current_user.student.id
    when 'lecturer' then current_user.lecturer.id
    when 'hod' then current_user.hod.id
    when 'dean' then current_user.dean.id
    end
  end

  def user_profile?(role)
    case role
    when 'student'
      Student.exists?(user_id: current_user.id)
    when 'lecturer'
      Lecturer.exists?(user_id: current_user.id)
    when 'hod'
      Hod.exists?(user_id: current_user.id)
    when 'dean'
      Dean.exists?(user_id: current_user.id)
    else
      false
    end
  end
end
