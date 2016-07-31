require 'test_helper'

class SupplierControllerTest < ActionController::TestCase
  test "should get name:text" do
    get :name:text
    assert_response :success
  end

  test "should get email:string" do
    get :email:string
    assert_response :success
  end

  test "should get phone:string" do
    get :phone:string
    assert_response :success
  end

end
