require 'test_helper'

class JobAplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_aplication = job_aplications(:one)
  end

  test "should get index" do
    get job_aplications_url
    assert_response :success
  end

  test "should get new" do
    get new_job_aplication_url
    assert_response :success
  end

  test "should create job_aplication" do
    assert_difference('JobAplication.count') do
      post job_aplications_url, params: { job_aplication: { adress: @job_aplication.adress, date_of_birth: @job_aplication.date_of_birth, education: @job_aplication.education, email: @job_aplication.email, job_id: @job_aplication.job_id, name: @job_aplication.name, phone_num: @job_aplication.phone_num } }
    end

    assert_redirected_to job_aplication_url(JobAplication.last)
  end

  test "should show job_aplication" do
    get job_aplication_url(@job_aplication)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_aplication_url(@job_aplication)
    assert_response :success
  end

  test "should update job_aplication" do
    patch job_aplication_url(@job_aplication), params: { job_aplication: { adress: @job_aplication.adress, date_of_birth: @job_aplication.date_of_birth, education: @job_aplication.education, email: @job_aplication.email, job_id: @job_aplication.job_id, name: @job_aplication.name, phone_num: @job_aplication.phone_num } }
    assert_redirected_to job_aplication_url(@job_aplication)
  end

  test "should destroy job_aplication" do
    assert_difference('JobAplication.count', -1) do
      delete job_aplication_url(@job_aplication)
    end

    assert_redirected_to job_aplications_url
  end
end
