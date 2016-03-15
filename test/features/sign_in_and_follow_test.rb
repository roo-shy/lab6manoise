require "test_helper"

class SignInAndFollowTest < Capybara::Rails::TestCase
  test "Can sign in and follow" do
    me = User.create! password: "password", username: "user"
    visit root_path
    click_on "Sign In" #, className: :btn
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_on "Sign In"
    click_link "Follow"
    save_and_open_page
    assert_content page, "Posts"

  end
end
