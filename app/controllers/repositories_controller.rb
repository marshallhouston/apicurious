class RepositoriesController < ApplicationController

  before_action :current_user, only: [:index]

  def index
    @repositories = GithubRepository.all_repositories(current_user)
  end

end
