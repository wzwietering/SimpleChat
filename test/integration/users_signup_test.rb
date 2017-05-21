require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Dodo",
                                         email: "dodo@hallo.nl",
                                         password:              "testtest",
                                         password_confirmation: "testtest" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
  end
end
