class FollowersController < ApplicationController

  before_action :current_user, only: [:index]

  def index
    @github_user = github_user
    @followers = github_user.followers(current_user)
    @starred_repos = StarredRepository.all_repositories(current_user)
  end

  private

  def github_service
    @github_service ||= GithubService.new(current_user)
  end

  def user_profile
    github_service.user_profile
  end

  def github_user
    @github_user ||= GithubUser.new(user_profile)
  end


end
