require 'rails_helper'

describe "As an authenticated user" do
  describe "when I visit my profile page" do
    it "I see my user github information" do
      # VCR.use_cassette("view profile information") do
      VCR.use_cassette("user_sees_github_profile_information") do

        stub_omniauth

        visit root_path

        click_link "Login with Github"
        within(".repositories") do
          expect(page).to have_content("Repositories 42")
        end
        # number of starred repos,
        within(".starred_repos") do
          expect(page).to have_content("Starred 6")
        end
        # followers, and
        within(".followers") do
          expect(page).to have_content("Followers 3")
        end
        # following
        within(".following") do
          expect(page).to have_content("Following 6")
        end
      end
    end
  end
end
