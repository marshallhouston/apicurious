class RepositoriesController < ApplicationController

  before_action :current_user, only: [:index]

  def index
    @repositories = GithubRepository.all_repositories(github_repositories)
  end

  private

  def github_repositories
    github_service.user_repos
  end

  def github_service
    @github_service ||= GithubService.new(current_user.token, current_user.username)
  end
end
