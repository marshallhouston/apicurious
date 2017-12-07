class StarredRepository

  attr_reader :full_name,
              :name,
              :description,
              :language,
              :last_updated,
              :repo_url

  def initialize(attrs)
    @full_name = attrs[:full_name]
    @name = attrs[:name]
    @description = attrs[:description]
    @language = attrs[:language]
    @last_updated = attrs[:updated_at]
    @repo_url = attrs[:html_url]
  end

  def self.all_repositories(token, username)
    starred_repos = GithubService.new(token, username).user_starred_repos
    starred_repos.map do |raw_repository|
      StarredRepository.new(raw_repository)
    end
  end
end
