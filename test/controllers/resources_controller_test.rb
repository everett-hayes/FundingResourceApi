require "test_helper"

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "should get index" do 
    get "http://127.0.0.1:3000/resource"
    assert_response :success
  end

  test "should get admin index" do 
    get "http://127.0.0.1:3000/admin/resource"
    assert_response :unauthorized
  end

  test "should post something" do 
    post "http://127.0.0.1:3000/resource"
    assert_response :unauthorized
  end

end
