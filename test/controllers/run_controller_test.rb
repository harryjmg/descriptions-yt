require 'test_helper'

class RunControllerTest < ActionDispatch::IntegrationTest
  test "should get select_videos" do
    get run_select_videos_url
    assert_response :success
  end

  test "should get edit_descriptions" do
    get run_edit_descriptions_url
    assert_response :success
  end

  test "should get publish_changes" do
    get run_publish_changes_url
    assert_response :success
  end

end
