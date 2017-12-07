require 'rails_helper'

describe "As an authenticated user" do
  describe "when I visit my profile page" do
    it "I see my user github information" do
      VCR.use_cassette("view profile information") do
        # As an authenticated user,
        # user = create :user
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        stub_omniauth

        visit root_path
        # after I successfully log in,
        click_link "Login with Github"
        # I should see my profile pic,
        # expect(page).to have_css("profile_picture")
        # repositories with number,
        within(".repositories") do
          expect(page).to have_content("Repositories")
        end
        # number of starred repos,
        within(".starred_repos") do
          expect(page).to have_content("Starred")
        end
        # followers, and
        within(".followers") do
          expect(page).to have_content("Followers")
        end
        # following
        within(".following") do
          expect(page).to have_content("Following")
        end
      end
    end
  end
end
