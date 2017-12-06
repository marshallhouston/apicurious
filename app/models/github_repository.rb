class GithubRepository

  attr_reader :name, :language, :last_updated

  def initialize(attrs)
    @name = attrs[:name]
    @language = attrs[:language]
    @last_updated = attrs[:updated_at]
  end

  def self.all_repositories(repos = {})
    repos.map do |raw_repository|
      GithubRepository.new(raw_repository)
    end
  end
end

# def find_all(state)
#   members = PropublicaService.find_house_members(state).map do |raw_member|
#     Member.new(raw_member)
#   end
#
#   sort_members(members)
# end
