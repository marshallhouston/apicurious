require 'rails_helper'

feature "As an authenticated user" do
  context "when I click on followers" do
    it "I see a list of all followers" do
      VCR.use_cassette("user_views_list_of_followers") do
        stub_omniauth

        visit root_path
        click_on "Login with Github"

        click_on "Followers"

        within ".followers" do
          expect(page).to have_content("wiseemily88")
          expect(page).to have_content("Maxscores")
          expect(page).to have_content("PlanetEfficacy")
        end
      end
    end
  end
end
