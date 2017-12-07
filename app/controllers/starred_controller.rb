class StarredController < ApplicationController

  before_action :current_user, only: [:index]

  def index
    @starred_repos = StarredRepository.all_repositories(token, username)
  end

  private

  def token
    current_user.token
  end

  def username
    current_user.username
  end

end
