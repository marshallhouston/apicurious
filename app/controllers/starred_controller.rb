class StarredController < ApplicationController

  before_action :current_user, only: [:index]

  def index
    @starred_repos = StarredRepository.all_repositories(current_user)
  end

end
