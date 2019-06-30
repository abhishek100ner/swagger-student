class Api::V1::SemestersController < Api::V1::ApiController
  before_action :authenticate_user!
  before_action :set_semester, only: [:show, :update, :destroy]

  swagger_controller :semesters, "User Management"

  swagger_api :index do
    summary "Fetches all User items"
    notes "This lists all the active semesters"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Team Id"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end

  def index
    @semesters = Semester.all
    render json: @semesters
  end

  
  def show
    render json: @semester
  end

  
  def create
    @semester = Semester.new(semester_params.merge(user_id: current_user.id))
    if @semester.save
      render json: @semester, status: :created#, location: @semester
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
      @semester = Semester.find(params[:id])
    end

    def semester_params
      params.require(:semester).permit(:name, :credits, :start_date, :end_date)
    end
end
