require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "should do a user test plz" do 
    get "http://127.0.0.1:3000/logged_in"
    assert_response :success
  end

end
