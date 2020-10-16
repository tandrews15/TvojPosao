require "application_system_test_case"

class JobAplicationsTest < ApplicationSystemTestCase
  setup do
    @job_aplication = job_aplications(:one)
  end

  test "visiting the index" do
    visit job_aplications_url
    assert_selector "h1", text: "Job Aplications"
  end

  test "creating a Job aplication" do
    visit job_aplications_url
    click_on "New Job Aplication"

    fill_in "Adress", with: @job_aplication.adress
    fill_in "Date of birth", with: @job_aplication.date_of_birth
    fill_in "Education", with: @job_aplication.education
    fill_in "Email", with: @job_aplication.email
    fill_in "Job", with: @job_aplication.job_id
    fill_in "Name", with: @job_aplication.name
    fill_in "Phone num", with: @job_aplication.phone_num
    click_on "Create Job aplication"

    assert_text "Job aplication was successfully created"
    click_on "Back"
  end

  test "updating a Job aplication" do
    visit job_aplications_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @job_aplication.adress
    fill_in "Date of birth", with: @job_aplication.date_of_birth
    fill_in "Education", with: @job_aplication.education
    fill_in "Email", with: @job_aplication.email
    fill_in "Job", with: @job_aplication.job_id
    fill_in "Name", with: @job_aplication.name
    fill_in "Phone num", with: @job_aplication.phone_num
    click_on "Update Job aplication"

    assert_text "Job aplication was successfully updated"
    click_on "Back"
  end

  test "destroying a Job aplication" do
    visit job_aplications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job aplication was successfully destroyed"
  end
end
