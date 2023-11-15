class Api::V1::CoursesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @courses = Course.all
    render json: @courses
  end
end
