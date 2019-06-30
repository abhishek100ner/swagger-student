class Api::V1::StudentsController < Api::V1::ApiController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /api/v1/students
  def index
    @students = Student.all

    render json: @students
  end

  # GET /api/v1/students/1
  def show
    render json: @student
  end

  # POST /api/v1/students
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/students/1
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.fetch(:student, {})
    end
end
