require "rails_helper"
RSpec.describe "Adminstrate Users", type: :system do
  before do
    admin = create(:admin)
    admin.confirm
    sign_in admin
  end

  it "updates user without password" do
    user = create(:user)
    visit edit_admin_user_path(user)
    expect(page).to have_text("Edit User ##{user.id}")
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

  it "update fails user with mis-typed password" do
    user = create(:user)
    visit edit_admin_user_path(user)
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "passwxrd"

    click_on "Update User"

    expect(page).to have_text("Password confirmation doesn't match Password")
  end

  describe "filters", js: true do
    describe "confirmed:" do
      it "filters out unconfirmed users" do
        user = create(:user)
        user.confirm
        unconfirmed_user = create(:user)
        visit admin_users_path
        fill_in "Search", with: "confirmed:"
        submit_search
        expect(page).to have_content(user.email)
        expect(page).not_to have_content(unconfirmed_user.email)
      end
    end

    describe "confirmed:" do
      it "filters out confirmed users" do
        user = create(:user)
        user.confirm
        unconfirmed_user = create(:user)
        visit admin_users_path
        fill_in "Search", with: "unconfirmed:"
        submit_search
        expect(page).to have_content(unconfirmed_user.email)
        expect(page).not_to have_content(user.email)
      end
    end

    describe "super_admin:" do
      it "filters out confirmed users" do
        user = create(:user)
        user.confirm
        admin_user = create(:admin)
        visit admin_users_path
        fill_in "Search", with: "super_admin:"
        submit_search
        expect(page).to have_content(admin_user.email)
        expect(page).not_to have_content(user.email)
      end
    end
  end

  def submit_search
    page.execute_script("$('.search').submit()")
  end
end
