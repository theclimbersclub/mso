require "rails_helper"
RSpec.describe "Adminstrate Users", type: :feature do
  before do
    admin = create(:admin)
    admin.confirm
    sign_in admin
  end

  it "updates user without password" do
    user = create(:user)
    visit edit_admin_user_path(user)

    click_on "Update User"

    expect(page).to have_text("User was successfully updated")
  end

  it "updates user with password" do
    user = create(:user)
    visit edit_admin_user_path(user)
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Update User"

    expect(page).to have_text("User was successfully updated")
  end

  it "update fails user with mis typed password" do
    user = create(:user)
    visit edit_admin_user_path(user)
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "passwxrd"

    click_on "Update User"

    expect(page).to have_text("Password confirmation doesn't match Password")
  end

  describe "filters", js: true do
    describe "confirmed" do
      it "filters out unconfirmed users" do
        user = create(:user)
        user.confirm
        unconfirmed_user = create(:user)
        visit admin_users_path
        fill_in "Search", with: "connfirmed:"
        submit_search
        expect(page).to have_content(user.email)
        expect(page).not_to have_content(unconfirmed_user.email)
      end
    end
  end

  def submit_search
    page.execute_script("$('.search').submit()")
  end
end
