require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'     # id="error_explanationが存在するか確認
    assert_select 'div.alert'                 # class="alert"が存在するか確認
    assert_select 'div.alert-danger'          # class="alert-danger"が存在するか確認
  end
end
