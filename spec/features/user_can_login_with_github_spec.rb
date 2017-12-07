require 'rails_helper'

feature "A visitor can login" do
  scenario "using github credentials" do
    VCR.use_cassette("user_login_github_credentials") do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Login with Github")
      click_link "Login with Github"

      expect(page).to have_content("marshallhouston")
      expect(page).to have_link("Logout")
    end
  end
end
