class GithubUser

  attr_reader :username,
              :picture,
              :repository_count,
              :number_of_followers,
              :following_other_users_count,
              :starred_repos

  def initialize(attrs = {})
    @username = attrs[:login]
    @repository_count = attrs[:public_repos]
    @number_of_followers = attrs[:followers]
    @following_other_users_count = attrs[:following]
  end

  def starred_repo_count
    starred_repos.count
  end

  def add_starred_repos(starred_repos)
    @starred_repos = starred_repos
  end

end
