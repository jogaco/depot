require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    dave = users(:one)
    post :create, name: dave.name, password: 'secret'
    assert_redirected_to admin_path
    assert_equal dave.id, session[:user_id]
  end

  test "should fail login" do
    dave = users(:one)
    post :create, name: dave.name, password: 'wrong'
    assert_redirected_to login_path
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_path
  end
end
