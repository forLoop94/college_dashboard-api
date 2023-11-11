class Api::V1::LecturersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @lecturers = Lecturer.all
    render json: @lecturers
  end
end