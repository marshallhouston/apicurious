require 'rails_helper'

feature "As an authenticated user" do
  scenario "when I click on starred I see a list of all my starred repositories" do
    VCR.use_cassette("user_views_all_starred_repositories") do
      stub_omniauth
      visit root_path
      click_on "Login with Github"

      click_on "Starred"

      within ".starred-repos" do
        expect(page).to have_css(".repo-full_name")
        
        expect(page).to have_css(".repo-description")
        expect(page).to have_css(".repo-language")
        expect(page).to have_css(".last-updated")
      end
    end
  end
end
