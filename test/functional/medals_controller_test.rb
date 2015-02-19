require 'test_helper'

class MedalsControllerTest < ActionController::TestCase
  test "should get heatmap_data" do
    get :heatmap_data
    assert_response :success
  end

end
