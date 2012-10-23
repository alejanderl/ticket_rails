require 'test_helper'

class AddressControllerTest < ActionController::TestCase
  test "should get :cities" do
    get ::cities
    assert_response :success
  end

end
