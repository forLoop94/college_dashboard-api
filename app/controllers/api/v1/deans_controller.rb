class Api::V1::DeansController < ApplicationController
  def index
    @deans = Dean.all
    render json: @deans
  end

  def show
    @dean = Dean.find(params[:id])
    render json: @dean
  end

  def dean_list
    # @dean = current_user.dean

    @students = Student.includes(:department).where(id: 10).select(:first_name, :last_name,
                                                                   :department_id).map do |student|
      {
        full_name: "#{student.first_name} #{student.last_name}",
        department: student.department.name,
        gpa: student.calculate_grade_point
      }
    end
    render json: @students
  end

  def hods_list
    @school_id = current_user.dean.school_id
    @departments = Department.where(school_id: @school_id)

    @hods = @departments.includes(:hod).map do |dept|
      {
        hod: dept.hod,
        department: {
          name: dept.name
        }
      }
    end
    render json: @hods
  end

  def create
    @dean = current_user.build_dean(dean_params)

    if @dean.save
      render json: { dean: @dean, message: 'Dean successfully created' }, status: :created
    else
      render json: @dean.errors, message: 'Dean could not be created', status: :unprocessable_entity
    end
  end

  def update
    @dean = Dean.find(params[:id])

    if @dean.update(dean_params)
      render json: { dean: @dean, message: 'Dean successfully updated' }, status: :ok
    else
      render json: @dean.errors, message: 'Dean could not be updated', status: :unprocessable_entity
    end
  end

  def destroy
    @dean = Dean.find(params[:id])

    @dean.destroy
    render json: { message: 'Dean successfully deleted' }, status: :ok
  end

  private

  def dean_params
    params.require(:dean).permit(:first_name, :last_name, :gender, :years_of_admin_exp, :number_of_publications,
                                 :highest_academic_qualification, :photo, :rank, :bio, :school_id,
                                 :age, :phone_number, :lga_of_origin)
  end
end
