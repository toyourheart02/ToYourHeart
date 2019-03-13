require 'test_helper'

class MasterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get master_new_url
    assert_response :success
  end

end
