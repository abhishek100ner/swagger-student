require 'test_helper'

class Api::V1::StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_student = api_v1_students(:one)
  end

  test "should get index" do
    get api_v1_students_url, as: :json
    assert_response :success
  end

  test "should create api_v1_student" do
    assert_difference('Api::V1::Student.count') do
      post api_v1_students_url, params: { api_v1_student: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_student" do
    get api_v1_student_url(@api_v1_student), as: :json
    assert_response :success
  end

  test "should update api_v1_student" do
    patch api_v1_student_url(@api_v1_student), params: { api_v1_student: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_student" do
    assert_difference('Api::V1::Student.count', -1) do
      delete api_v1_student_url(@api_v1_student), as: :json
    end

    assert_response 204
  end
end
