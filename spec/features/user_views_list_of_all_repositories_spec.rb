require 'rails_helper'

xfeature "As an authenticated user" do
  scenario "when I click on repositories I see a list of all my repositories" do
    click_on "Repositories"

    expect(current_path).to eq(user_repositories_path(user))

    within ".repositories" do
      expect(page).to have_css(".repo-name")
      expect(page).to have_css(".repo-language")
      expect(page).to have_css(".last-updated")
    end
  end
end
