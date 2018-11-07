require 'test_helper'

class Profile::DevicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_devices_index_url
    assert_response :success
  end

end
