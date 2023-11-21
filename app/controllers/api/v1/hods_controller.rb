class Api::V1::HodsController < ApplicationController
  def index
    @hods = Hods.all
    render json: @hods
  end

  def show
    @hod = Hod.find(params[:id])
    render json: @hod
  end

  def create
    @hod = Hod.new(hod_params)

    if @hod.save
      render json: { hod: @hod, message: "HOD successfully created" }, status: :created
    else
      render json: @hod.errors, message: "HOD could not be created", status: :unprocessable_entity
    end
  end

  def update
    @hod = Hod.find(params[:id])

    if @hod.update(hod_params)
      render json: { hod: @hod, message: "HOD successfully updated" }, status: :ok
    else
      render json: @hod.errors, message: "HOD could not be updated", status: :unprocessable_entity
    end
  end

  def destroy
    @hod = Hod.find(params[:id])

    @hod.destroy
    render json: { message: "HOD successfully deleted", }, status: :ok
  end

  private

  def hod_params
    params.require(:hod).permit(:first_name, :last_name, :gender, :years_of_admin_exp, :number_of_publications, :highest_academic_qualification, :photo, :rank, :bio, :department_id, :age, :phone_number, :lga_of_origin)
  end
end
