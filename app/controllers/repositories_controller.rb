class RepositoriesController < ApplicationController

  before_action :current_user, only: [:index]

  def index
    @github_user = github_user
    @repositories = GithubRepository.all_repositories(current_user)
    @starred_repos = StarredRepository.all_repositories(current_user)
  end

  private

  def github_user
    @github_user ||= GithubUser.new(user_profile)
  end

  def user_profile
    github_service.user_profile
  end

  def github_service
    @github_service ||= GithubService.new(current_user)
  end


end
