require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Bert",
                                         email: "bert@hallo.nl",
                                         password:              "hallo!",
                                         password_confirmation: "hallo!" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.FILL_IN
  end
end
