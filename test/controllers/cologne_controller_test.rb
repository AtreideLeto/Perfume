require 'test_helper'

class CologneControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cologne_new_url
    assert_response :success
  end

end
