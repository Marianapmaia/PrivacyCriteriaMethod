require 'test_helper'

class PrivacyCriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @privacy_criterium = privacy_criteria(:one)
  end

  test "should get index" do
    get privacy_criteria_url
    assert_response :success
  end

  test "should get new" do
    get new_privacy_criterium_url
    assert_response :success
  end

  test "should create privacy_criterium" do
    assert_difference('PrivacyCriterium.count') do
      post privacy_criteria_url, params: { privacy_criterium: { description: @privacy_criterium.description, id_pc: @privacy_criterium.id_pc, name: @privacy_criterium.name, owner: @privacy_criterium.owner, privacy_compliance: @privacy_criterium.privacy_compliance, privacy_preference: @privacy_criterium.privacy_preference, processor: @privacy_criterium.processor, project_id: @privacy_criterium.project_id, rel_owner: @privacy_criterium.rel_owner, rel_processor: @privacy_criterium.rel_processor, rel_third: @privacy_criterium.rel_third, requirement: @privacy_criterium.requirement, source: @privacy_criterium.source, third: @privacy_criterium.third } }
    end

    assert_redirected_to privacy_criterium_url(PrivacyCriterium.last)
  end

  test "should show privacy_criterium" do
    get privacy_criterium_url(@privacy_criterium)
    assert_response :success
  end

  test "should get edit" do
    get edit_privacy_criterium_url(@privacy_criterium)
    assert_response :success
  end

  test "should update privacy_criterium" do
    patch privacy_criterium_url(@privacy_criterium), params: { privacy_criterium: { description: @privacy_criterium.description, id_pc: @privacy_criterium.id_pc, name: @privacy_criterium.name, owner: @privacy_criterium.owner, privacy_compliance: @privacy_criterium.privacy_compliance, privacy_preference: @privacy_criterium.privacy_preference, processor: @privacy_criterium.processor, project_id: @privacy_criterium.project_id, rel_owner: @privacy_criterium.rel_owner, rel_processor: @privacy_criterium.rel_processor, rel_third: @privacy_criterium.rel_third, requirement: @privacy_criterium.requirement, source: @privacy_criterium.source, third: @privacy_criterium.third } }
    assert_redirected_to privacy_criterium_url(@privacy_criterium)
  end

  test "should destroy privacy_criterium" do
    assert_difference('PrivacyCriterium.count', -1) do
      delete privacy_criterium_url(@privacy_criterium)
    end

    assert_redirected_to privacy_criteria_url
  end
end
