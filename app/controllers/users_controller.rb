class UsersController < ApplicationController

  before_action :current_user, only: [:show]

  def show
    @github_user = github_user
    @starred_repos = StarredRepository.all_repositories(current_user)
  end

  private

  def github_user
    @github_user ||= GithubUser.new(raw_github_user)
  end

  def raw_github_user
    github_service.user_profile
  end

  def github_service
    @github_service ||= GithubService.new(current_user)
  end

end
