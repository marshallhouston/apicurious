require 'rails_helper'

feature "As an authenticated user" do
  scenario "when I click on repositories I see a list of all my repositories" do
    VCR.use_cassette("user_views_all_repositories") do
      stub_omniauth

      visit root_path
      click_on "Login with Github"

      click_on "Repositories"

      within ".repositories-container" do
        expect(page).to have_css(".repo-name")
        expect(page).to have_content("activerecord_exploration")
        expect(page).to have_css(".repo-language")
        expect(page).to have_content("Ruby")
        expect(page).to have_css(".last-updated")
        expect(page).to have_content("2017-10-03T03")
      end
    end
  end
end
