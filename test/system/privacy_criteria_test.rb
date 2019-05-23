require "application_system_test_case"

class PrivacyCriteriaTest < ApplicationSystemTestCase
  setup do
    @privacy_criterium = privacy_criteria(:one)
  end

  test "visiting the index" do
    visit privacy_criteria_url
    assert_selector "h1", text: "Privacy Criteria"
  end

  test "creating a Privacy criterium" do
    visit privacy_criteria_url
    click_on "New Privacy Criterium"

    fill_in "Description", with: @privacy_criterium.description
    fill_in "Id pc", with: @privacy_criterium.id_pc
    fill_in "Name", with: @privacy_criterium.name
    fill_in "Owner", with: @privacy_criterium.owner
    fill_in "Privacy compliance", with: @privacy_criterium.privacy_compliance
    fill_in "Privacy preference", with: @privacy_criterium.privacy_preference
    fill_in "Processor", with: @privacy_criterium.processor
    fill_in "Project", with: @privacy_criterium.project_id
    fill_in "Rel owner", with: @privacy_criterium.rel_owner
    fill_in "Rel processor", with: @privacy_criterium.rel_processor
    fill_in "Rel third", with: @privacy_criterium.rel_third
    fill_in "Requirement", with: @privacy_criterium.requirement
    fill_in "Source", with: @privacy_criterium.source
    fill_in "Third", with: @privacy_criterium.third
    click_on "Create Privacy criterium"

    assert_text "Privacy criterium was successfully created"
    click_on "Back"
  end

  test "updating a Privacy criterium" do
    visit privacy_criteria_url
    click_on "Edit", match: :first

    fill_in "Description", with: @privacy_criterium.description
    fill_in "Id pc", with: @privacy_criterium.id_pc
    fill_in "Name", with: @privacy_criterium.name
    fill_in "Owner", with: @privacy_criterium.owner
    fill_in "Privacy compliance", with: @privacy_criterium.privacy_compliance
    fill_in "Privacy preference", with: @privacy_criterium.privacy_preference
    fill_in "Processor", with: @privacy_criterium.processor
    fill_in "Project", with: @privacy_criterium.project_id
    fill_in "Rel owner", with: @privacy_criterium.rel_owner
    fill_in "Rel processor", with: @privacy_criterium.rel_processor
    fill_in "Rel third", with: @privacy_criterium.rel_third
    fill_in "Requirement", with: @privacy_criterium.requirement
    fill_in "Source", with: @privacy_criterium.source
    fill_in "Third", with: @privacy_criterium.third
    click_on "Update Privacy criterium"

    assert_text "Privacy criterium was successfully updated"
    click_on "Back"
  end

  test "destroying a Privacy criterium" do
    visit privacy_criteria_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Privacy criterium was successfully destroyed"
  end
end
