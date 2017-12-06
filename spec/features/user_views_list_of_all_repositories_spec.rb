require 'rails_helper'

feature "As an authenticated user" do
  scenario "when I click on repositories I see a list of all my repositories" do
    user = create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    github_user = GithubUser.new(stub_omniauth)

    visit user_path(user)
    click_on "Repositories"

    expect(current_path).to eq(user_repositories_path(user))

    within ".repositories" do
      expect(page).to have_css(".repo_name")
      expect(page).to have_css(".repo_language")
      expect(page).to have_css(".last_updated")
    end
  end
end