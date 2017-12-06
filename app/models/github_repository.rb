class GithubRepository

  attr_reader :name, :language, :last_updated, :repo_url

  def initialize(attrs)
    @name = attrs[:name]
    @language = attrs[:language]
    @last_updated = attrs[:updated_at]
    @repo_url = attrs[:html_url]
  end

  def self.all_repositories(repos = {})
    repos.map do |raw_repository|
      GithubRepository.new(raw_repository)
    end
  end
end
