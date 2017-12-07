class UsersController < ApplicationController

  before_action :current_user, only: [:show]

  def show
    # github user
    # starred repositories

    @github_user = github_user
    @github_user.add_starred_repos(github_service.user_starred_repos)
  end

  private

  def github_user
    @github_user ||= GithubUser.new(raw_github_user)
  end

  def raw_github_user
    github_service.user_profile
  end

  def github_service
    @github_service ||= GithubService.new(token, username)
  end

  def token
    current_user.token
  end

  def username
    current_user.username
  end
end
