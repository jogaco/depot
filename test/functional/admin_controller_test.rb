require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should be logged in for admin tasks' do
    logout()
    get :index
    assert_redirected_to login_path
  end

end
