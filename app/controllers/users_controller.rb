class UsersController < ApplicationController

  before_action :current_user, only: [:show]

  def show
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
    @github_service ||= GithubService.new(current_user.token, current_user.username)
  end
end

# user_info_request = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
# @parsed_user = JSON.parse(user_info_request.body)
