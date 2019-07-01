class Api::V1::SemestersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_semester, only: [:show, :update, :destroy]

  def index
    @semesters = current_user.semesters
    render json: @semesters
  end

  
  def show
    render json: @semester
  end

  
  def create
    @semester = Semester.new(semester_params.merge(user_id: current_user.id))
    if @semester.save
      render json: @semester, status: :created
    else
      render json: @semester.errors, status: :unprocessable_entity
    end
  end

  
  def update
    if @semester.update(semester_params)
      render json: @semester
    else
      render json: @semester.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    @semester.destroy
  end

  private
    def set_semester
      @semester = current_user.semesters.find(params[:id])
    end

    def semester_params
      params.require(:semester).permit(:name, :credits, :start_date, :end_date)
    end
end
