require 'test_helper'

class Api::V1::SemestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_semester = api_v1_semesters(:one)
  end

  test "should get index" do
    get api_v1_semesters_url, as: :json
    assert_response :success
  end

  test "should create api_v1_semester" do
    assert_difference('Api::V1::Semester.count') do
      post api_v1_semesters_url, params: { api_v1_semester: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_semester" do
    get api_v1_semester_url(@api_v1_semester), as: :json
    assert_response :success
  end

  test "should update api_v1_semester" do
    patch api_v1_semester_url(@api_v1_semester), params: { api_v1_semester: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_semester" do
    assert_difference('Api::V1::Semester.count', -1) do
      delete api_v1_semester_url(@api_v1_semester), as: :json
    end

    assert_response 204
  end
end
