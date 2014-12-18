require 'test_helper'

class EnginesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
