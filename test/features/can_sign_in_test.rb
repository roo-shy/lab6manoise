require "test_helper"

class CanSignInTest < Capybara::Rails::TestCase
  test "Can view timeline after sign in" do
    me = User.create! password: "password", username: "user"

    visit root_path
    click_on "Sign In" #, className: :btn
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_on "Sign In"
    assert_content page, "Timeline"

  end
end
