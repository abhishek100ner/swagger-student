class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_semester
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    @students = current_user.students.where(semester_id: @semester.id)
    render json: @students
  end

  def show
    render json: @student
  end

  def create
    @student = @semester.students.new(student_params.merge(user_id: current_user.id))
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
  end

  private
    
    def set_student
      @student = @semester.students.find(params[:id])
    end

    def set_semester
      @semester = current_user.semesters.find(params[:semester_id])
    end

    def student_params
      params.require(:student).permit(:name, :description, :dob, :age)
    end
end
